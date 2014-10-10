require 'spec_helper'

RSpec.describe "items/edit", :type => :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :name => "MyString",
      :description => "MyText",
      :price => "9.99",
      :image => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_name[name=?]", "item[name]"

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_price[name=?]", "item[price]"

      assert_select "input#item_image[name=?]", "item[image]"
    end
  end
end
