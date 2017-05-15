class LikesController < ApplicationController
  def create
    Like.create(like_params)
    redirect_to :back
  end

  def destroy
    Like.find_by(like_params).destroy
    redirect_to :back
  end

  private

  def like_params
    params.require(:like).permit(:proyect_id, :user_id)

  end


end
