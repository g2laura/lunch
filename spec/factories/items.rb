# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyText"
    price "8"
    image "MyString"
  end
end
