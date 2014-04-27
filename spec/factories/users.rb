# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    username  Faker::Internet.user_name
    password "password123"
    password_confirmation "password123"
  end
end
