# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  name = Faker::Name.first_name
  user = User.create(email: "#{name}@gmail.com", password: 'password', daily_goal: rand(8..15), metric: "cups")
  day = Day.create(date: Date.new(rand(100)))
  user_day = UserDay.create(user_id: user.id, day_id: day.id, amount: rand(7..15))
end
