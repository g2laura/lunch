require 'spec_helper'

RSpec.describe "menus/edit", :type => :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :restaurant => nil
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_restaurant_id[name=?]", "menu[restaurant_id]"
    end
  end
end
