# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean
User.destroy_all
Proyect.destroy_all
Comment.destroy_all
Category.destroy_all


# Create Users
5.times do
  User.create(
      username: Faker::GameOfThrones.unique.character,
      mail: Faker::Internet.unique.email,
      password: Faker::Internet.password,
      admin: 0
  )
end

# User for testing purposes
u = User.create(
    username: 'grupo11',
    mail: 'a@a.com',
    password: '123456',
    admin: 1
)

# Create Categories
c = Category.create(name: 'Fun', description: 'Projects made for fun')
c1 = Category.create(name: 'Business', description: 'Projects related to business transactions')
c2 = Category.create(name: 'Educational', description: 'Projects made for educational purposes')
c3 = Category.create(name: 'Sports', description: 'Projects related to sports')


# Create Projects
usernames = User.pluck(:username)
30.times do
  Proyect.create(
      name: Faker::GameOfThrones.city,
      description: Faker::Lorem.sentence,
      initial_date: Faker::Date.backward(30),
      due_date: Faker::Date.forward(30),
      actual_money: Faker::Number.between(0, 100),
      goal_money: Faker::Number.between(100, 300),
      score: Faker::Number.between(1, 100),
      founder: usernames.sample,
      category_id: Faker::Number.between(0, 3)
  )
end

# Create comments
project_ids = Proyect.pluck(:id)
user_ids = User.pluck(:id)
50.times do
  Comment.create(
      comment_text: Faker::Lorem.sentence,
      user_id: user_ids.sample,
      proyect_id: project_ids.sample
  )
end
