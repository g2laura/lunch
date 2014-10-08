# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :restaurant do
    name "Name"
    description "MyText"
    slogan "Slogan"
    phone_number "Phone Number"
    email "Email"
    address "MyText"
    twitter "Twitter"
    instagram "Instagram"
    facebook "Facebook"
    website "Website"
    delivery false
  end
end
