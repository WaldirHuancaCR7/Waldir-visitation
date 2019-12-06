FactoryBot.define do
  factory :person do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    dni { Faker::IDNumber.valid }
    phone { Faker::PhoneNumber.phone_number }
    person_type { Person.person_types.keys.sample}
    user
  end
end