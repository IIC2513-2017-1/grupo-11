class DonationsController < ApplicationController
  include Permission

  before_action :set_proyect, only: [:create]
  before_action :logged_in?

  def create
    if @proyect.due_date > Date.today
      donation = Donation.create(donation_params)
      if donation.proyect.total_amount >= donation.proyect.goal_money
        donation.proyect.donators.uniq.each do |donator|
          if donator != donation.proyect.founder
            UserMailer.goal_money_ready(donator, donation.proyect).deliver_now
          elsif
            UserMailer.goal_money_founder(donator, donation.proyect).deliver_now
          end
        end
      end
      if donation.user != donation.proyect.founder
        UserMailer.donate(donation.proyect.founder, donation.proyect, donation.amount).deliver_now
      end
      respond_to do |format|
        format.js
      end
      #redirect_to :back

    end

  end

  def destroy
    # Donation.find_by(l_params).destroy
    redirect_to :back
  end

  private

  def donation_params
    params.require(:donation).permit(:amount).merge(params.permit(:user_id, :proyect_id))
  end

  def set_proyect
    @proyect = Proyect.find(params[:proyect_id])
  end
end
