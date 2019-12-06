FactoryBot.define do
  factory :student do
    code { Faker::IDNumber.valid }
    person
    professional_school
    study_cycle
    study_group
    religion
    address { "#{Faker::Address.street_name} #{Faker::Address.street_address}"}
    reference { Faker::Address.secondary_address }
    student_type { Student.student_types.keys.sample }
    urgent { Faker::Boolean.boolean }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    church { Faker::Company.name }
    sabbath_school_class { Faker::Educator.campus }
    baptized { Faker::Boolean.boolean }
    church_adresss { "#{Faker::Address.street_name} #{Faker::Address.street_address}"}
  end
end