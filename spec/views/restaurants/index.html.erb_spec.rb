require 'spec_helper'

RSpec.describe "restaurants/index", :type => :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        :name => "Name",
        :description => "MyText",
        :slogan => "Slogan",
        :phone_number => "Phone Number",
        :email => "Email",
        :address => "MyText",
        :twitter => "Twitter",
        :instagram => "Instagram",
        :facebook => "Facebook",
        :website => "Website",
        :image => "http://maidosakebar.com/wp-content/uploads/2014/06/Sushi_pic_1.jpeg",
        :delivery => false
      ),
      Restaurant.create!(
        :name => "Name",
        :description => "MyText",
        :slogan => "Slogan",
        :phone_number => "Phone Number",
        :email => "Email",
        :address => "MyText",
        :twitter => "Twitter",
        :instagram => "Instagram",
        :facebook => "Facebook",
        :website => "Website",
        :image => "http://maidosakebar.com/wp-content/uploads/2014/06/Sushi_pic_1.jpeg",
        :delivery => false
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "div.image", :style => "background-image: url(http://maidosakebar.com/wp-content/uploads/2014/06/Sushi_pic_1.jpeg)".to_s.to_s
  end
end
