require 'spec_helper'

RSpec.describe "restaurants/show", :type => :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Slogan/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Instagram/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/false/)
  end
end
