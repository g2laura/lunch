FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name      "user"
    email     { FactoryGirl.generate(:email) }
    password  "12345678"
  end
end