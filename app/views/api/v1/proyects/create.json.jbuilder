
json.proyect do
  json.id @proyect.id
  json.name @proyect.name
  json.description @proyect.description
  json.initial_date @proyect.initial_date
  json.due_date @proyect.due_date
  json.actual_money @proyect.actual_money
  json.goal_money @proyect.goal_money
  json.score @proyect.score

  json.founder do
    json.mail @proyect.founder.mail
    json.username @proyect.founder.username
  end
end
