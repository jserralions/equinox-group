FactoryGirl.define do
  factory :user do
    name 'TestUser'
    email { Faker::Internet.email }
    password 'password123'
    password_confirmation 'password123'
  end
end
