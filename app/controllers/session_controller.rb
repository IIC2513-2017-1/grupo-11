class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.username}" and return
    end
    redirect_to(new_session_path, alert: 'Wrong credentials')
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successful'

  end
end
