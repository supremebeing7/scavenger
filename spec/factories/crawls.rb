# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crawl do
    name Faker::Company.catch_phrase
    description "It's time to put on makeup. It's time to dress up right. It's time to raise the curtain on the Muppet Show tonight. It's a beautiful day in this neighborhood a beautiful day for a neighbor. Would you be mine? Could you be mine? Its a neighborly day in this beautywood a neighborly day for a beauty. Would you be mine? Could you be mine."
  end
end
