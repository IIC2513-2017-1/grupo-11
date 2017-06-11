class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    respond_to do |format|
      format.js
    end
    #redirect_to :back
  end

  def destroy
    Like.find_by(like_params).destroy
    respond_to do |format|
      format.js
    end
    #redirect_to :back
  end

  private
  def like_params
    params.require(:like).permit(:proyect_id, :user_id)
  end

end
