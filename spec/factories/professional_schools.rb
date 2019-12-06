FactoryBot.define do
  factory :professional_school do
    name { "#{Faker::Educator.degree} #{Faker::Number.number(digits: 3)}" }
  end
end