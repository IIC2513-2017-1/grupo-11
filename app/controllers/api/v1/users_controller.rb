module Api::V1
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render "api/v1/users/show.json.jbuilder"
    end
  end
end
