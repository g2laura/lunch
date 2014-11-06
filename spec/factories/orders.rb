# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    user nil
    item nil
    restaurant nil
    price "9.99"
  end
end
