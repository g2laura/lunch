require 'spec_helper'

RSpec.describe "menus/index", :type => :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :restaurant => nil
      ),
      Menu.create!(
        :restaurant => nil
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
