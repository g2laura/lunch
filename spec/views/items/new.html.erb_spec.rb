require 'spec_helper'

RSpec.describe "items/new", :type => :view do
  before(:each) do
    assign(:item, Item.new(
      :name => "MyString",
      :description => "MyText",
      :price => "9.99",
      :image => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_image[name=?]", "item[image]"
    end
  end
end
