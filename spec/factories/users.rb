FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    user_type { User.user_types.keys.sample }
  end
end