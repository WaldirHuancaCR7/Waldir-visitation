FactoryBot.define do
  factory :study_cycle do
    name { Faker::Educator.course_name }
  end
end