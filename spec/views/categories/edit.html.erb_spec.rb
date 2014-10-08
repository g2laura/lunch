require 'spec_helper'

RSpec.describe "categories/edit", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :name => "MyString",
      :description => "MyText",
      :menu => nil
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "textarea#category_description[name=?]", "category[description]"

      assert_select "input#category_menu_id[name=?]", "category[menu_id]"
    end
  end
end
