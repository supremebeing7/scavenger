# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "MyString"
    description "MyText"
    address "MyString"
    phone "MyString"
    website "MyString"
  end
end
