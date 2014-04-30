# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crawl do
    name Faker::Company.catch_phrase
    description Faker::Lorem.paragraph
  end
end
