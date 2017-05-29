class DonationsController < ApplicationController
  def create
    donation = Donation.create(donation_params)
    UserMailer.donate(donation.proyect.founder, donation.proyect, donation.amount).deliver_now
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
