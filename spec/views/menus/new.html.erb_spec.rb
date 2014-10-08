require 'spec_helper'

RSpec.describe "menus/new", :type => :view do
  before(:each) do
    assign(:menu, Menu.new(
      :restaurant => nil
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_restaurant_id[name=?]", "menu[restaurant_id]"
    end
  end
end
