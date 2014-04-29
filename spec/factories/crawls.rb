# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :crawl do
    name "MyString"
    description "MyText"
    user_id 1
    public false
  end
end
