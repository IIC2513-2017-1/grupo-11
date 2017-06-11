module ProyectsHelper

  def edit_button(proyect)
    return unless proyect.founder == current_user.try(:username) || current_user.try(:admin?)
    button_to 'Edit', edit_proyect_path(proyect), method: :get
  end

  def destroy_button(proyect)
    return unless proyect.founder == current_user.try(:username) || current_user.try(:admin?)
    button_to 'Destroy', proyect, method: :delete, data: { confirm: 'Are you sure?' }
  end

  def like_button(proyect)
    return unless current_user
    if proyect.is_liker(current_user)
      like = proyect.likes.where(user: current_user).first
      button_to 'Unlike', {controller: "likes", action: "destroy", like: {proyect_id: proyect.id, user_id: current_user.id}} , method: :delete
    else
      button_to 'Like', {controller: "likes", action: "create", like: {proyect_id: proyect.id, user_id: current_user.id}} , method: :post 
    end
  end

  def donate_form(proyect)
    return unless current_user
    capture do
      form_tag(donations_path, method: "post", remote: true) do |f|
        concat number_field :donation, :amount, input_html: { min: '0', step: 'any' }
        concat hidden_field_tag :proyect_id, @proyect.id
        concat hidden_field_tag :user_id, current_user.id
        concat submit_tag "Donar"
      end
    end
  end



end
