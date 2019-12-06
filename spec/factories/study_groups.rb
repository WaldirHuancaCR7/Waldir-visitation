FactoryBot.define do
  factory :study_group do
    name { "#{Faker::Educator.campus} #{Faker::Number.number(digits: 3)}" }
  end
end