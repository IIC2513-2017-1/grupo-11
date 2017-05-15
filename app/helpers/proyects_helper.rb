module ProyectsHelper

  def edit_button(proyect)
    return unless proyect.founder == current_user.try(:username)
    link_to 'Edit', edit_proyect_path(proyect)
  end

  def destroy_button(proyect)
    return unless proyect.founder == current_user.try(:username)
    link_to 'Destroy', proyect, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def like_button(proyect)
    if proyect.is_liker(current_user)
      like = proyect.likes.where(user: current_user).first
      button_to 'Unlike', {controller: "likes", action: "destroy", like: {proyect_id: proyect.id, user_id: current_user.id}} , method: :delete
    else
      button_to 'Like', {controller: "likes", action: "create", like: {proyect_id: proyect.id, user_id: current_user.id}} , method: :post
    end
  end

  def donate_button(proyect)
    button_to 'Donate', {controller: "donations", action: "create", donation: {proyect_id: proyect.id, user_id: current_user.id, amount: 10}} , method: :post
  end
end
