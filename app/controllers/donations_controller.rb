class DonationsController < ApplicationController
  def create
    donation = Donation.create(donation_params)
    if donation.proyect.actual_money >= donation.proyect.goal_money
      donation.proyect.donations.each do |don|
        UserMailer.goal_money_ready(don.user, donation.proyect).deliver_now
      end
    end
    if donation.user != donation.proyect.founder
      UserMailer.donate(donation.proyect.founder, donation.proyect, donation.amount).deliver_now
    end
    redirect_to :back
  end

  def destroy
    # Donation.find_by(l_params).destroy
    redirect_to :back
  end

  private

  def donation_params
    params.require(:donation).permit(:amount).merge(params.permit(:user_id, :proyect_id))
  end
end
