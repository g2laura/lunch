require 'spec_helper'

RSpec.describe "restaurants/new", :type => :view do
  before(:each) do
    assign(:restaurant, Restaurant.new(
      :name => "MyString",
      :description => "MyText",
      :slogan => "MyString",
      :phone_number => "MyString",
      :email => "MyString",
      :address => "MyText",
      :twitter => "MyString",
      :instagram => "MyString",
      :facebook => "MyString",
      :website => "MyString",
      :delivery => false
    ))
  end

  it "renders new restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurants_path, "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "textarea#restaurant_description[name=?]", "restaurant[description]"

      assert_select "input#restaurant_slogan[name=?]", "restaurant[slogan]"

      assert_select "input#restaurant_phone_number[name=?]", "restaurant[phone_number]"

      assert_select "input#restaurant_email[name=?]", "restaurant[email]"

      assert_select "textarea#restaurant_address[name=?]", "restaurant[address]"

      assert_select "input#restaurant_twitter[name=?]", "restaurant[twitter]"

      assert_select "input#restaurant_instagram[name=?]", "restaurant[instagram]"

      assert_select "input#restaurant_facebook[name=?]", "restaurant[facebook]"

      assert_select "input#restaurant_website[name=?]", "restaurant[website]"

      assert_select "input#restaurant_delivery[name=?]", "restaurant[delivery]"
    end
  end
end
