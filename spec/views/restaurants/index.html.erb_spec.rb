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
        :delivery => false
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", :text => "Name".to_s
    assert_select "tr>td", :text => "MyText".to_s
    assert_select "tr>td", :text => "Slogan".to_s
    assert_select "tr>td", :text => "Phone Number".to_s
    assert_select "tr>td", :text => "Email".to_s
    assert_select "tr>td", :text => "MyText".to_s
    assert_select "tr>td", :text => "Twitter".to_s
    assert_select "tr>td", :text => "Instagram".to_s
    assert_select "tr>td", :text => "Facebook".to_s
    assert_select "tr>td", :text => "Website".to_s
    assert_select "tr>td", :text => false.to_s
  end
end
