# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyText"
    price "9.99"
    image "MyString"
  end
end
