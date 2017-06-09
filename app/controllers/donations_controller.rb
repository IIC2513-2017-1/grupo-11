class DonationsController < ApplicationController
  before_action :set_proyect, only: [:create]

  def create
    if @proyect.due_date > Date.today
      donation = Donation.create(donation_params)
      UserMailer.donate(donation.proyect.founder, donation.proyect, donation.amount).deliver_now
      redirect_to :back
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
