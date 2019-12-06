FactoryBot.define do
  factory :religion do
    name { "#{Faker::Military.army_rank} #{Faker::Number.number(digits: 3)}"}
  end
end