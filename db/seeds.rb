# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: "test1@test.com", password: 'thuan274', password_confirmation: 'thuan274')
5.times do |n|
  title = Faker::Date.between(6.days.ago, Date.today)
  list = List.create!(
    title: title,
    user_id: user.id
  )
  5.times do |m|
    title = Faker::Name.name
    complete = Faker::Boolean.boolean(0.3)
    Task.create!(
        title: title,
        complete: complete,
        list_id: list.id    
        )
  end  
end
