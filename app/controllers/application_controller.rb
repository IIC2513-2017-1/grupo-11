class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    return @current_user if defined?(@current_user)
    if session.key?(:user_id) && User.where(id: session[:user_id]).exists?
      @current_user = User.find(session[:user_id])
    end
  end
end
