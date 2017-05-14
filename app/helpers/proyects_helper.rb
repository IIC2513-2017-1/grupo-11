module ProyectsHelper

  def edit_button(proyect)
    return unless proyect.founder == current_user.try(:username)
    link_to 'Edit', edit_proyect_path(proyect)
  end

  def destroy_button(proyect)
    return unless proyect.founder == current_user.try(:username)
    link_to 'Destroy', proyect, method: :delete, data: { confirm: 'Are you sure?' }
  end

end
