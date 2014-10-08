require 'spec_helper'

RSpec.describe "menus/show", :type => :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :restaurant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
