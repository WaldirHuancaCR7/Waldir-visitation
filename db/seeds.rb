# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.test?
  user = User.create!(email: 'pastor@whelming.ml', password: 'password', user_type: 'visitor')
  person = Person.create!(first_name: "Pedro",
                        last_name: "Infante",
                        dni: "12345678",
                        phone: "97523465",
                        person_type: "pastor",
                        user_id: user.id)
  students = FactoryBot.create_list(:student, 10)
end
