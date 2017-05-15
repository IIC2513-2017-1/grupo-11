class DonationsController < ApplicationController
  def create
    Donation.create(donation_params)
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
