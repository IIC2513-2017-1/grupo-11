module Permission
  extend ActiveSupport::Concern

  def logged_in?
    redirect_to(root_path, notice: 'Must log in for that') unless current_user
  end

  def is_mine?(object) # For all but projects
    redirect_to(root_path, notice: 'Not authorized') unless (object.user_id == current_user.try(:id) || current_user.try(:admin?))
  end

  def is_admin?
    redirect_to(root_path, notice: 'Must be admin for that') unless current_user.try(:admin?)
  end

  def is_founder?(project) # Projects
    redirect_to(root_path, notice: 'You must have founded a proyect to edit/destroy it') unless
        (project.founder == current_user.try(:username) || current_user.try(:admin?))
  end

end