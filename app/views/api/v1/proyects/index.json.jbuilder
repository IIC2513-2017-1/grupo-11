
json.array! @proyects do |proyect|
  json.id proyect.id
  json.name proyect.name
  json.description proyect.description
  json.initial_date proyect.initial_date
  json.due_date proyect.due_date
  json.actual_money proyect.actual_money
  json.goal_money proyect.goal_money
  json.score proyect.score

  json.founder do
    json.mail proyect.founder.mail
    json.username proyect.founder.username
  end

  json.donations do
    json.array! proyect.donations do |donation|
      json.mail donation.user.mail
      json.username donation.user.username
      json.user_id donation.user.id
      json.amount donation.amount
    end
  end

  json.likes do
    json.array! proyect.likes do |like|
      json.mail like.user.mail
      json.username like.user.username
      json.user_id like.user.id
    end
  end

  json.comments do
    json.array! proyect.comments do |comment|
      json.user_id comment.user.id
      json.mail comment.user.mail
      json.username comment.user.username
      json.text comment.comment_text
      json.date comment.comment_date
    end
  end
end
