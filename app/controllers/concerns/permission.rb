module Permission
  extend ActiveSupport::Concern

  def logged_in?
    redirect_to(root_path, notice: 'Must log in for that') unless current_user
  end

  def is_mine?(object) # For all but projects
    redirect_to(root_path, notice: 'Not authorized') unless object.user_id == current_user.id
  end

  #Need to do is_mine? verification to projects through join table
  #Need to implement is_admin attribute to let admin_users create categories
end