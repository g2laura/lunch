require "spec_helper"

class TestHelper < ActionView::Base; end

describe ApplicationHelper do
  let(:helper)   { TestHelper.new }
  let(:user)     { FactoryGirl.build :user }
  let(:builder)  { ActionView::Helpers::FormBuilder.new :user, user, helper, {}, nil }

  describe "#hidden_fields" do
    it "render the form hidden fields" do
      expect(hidden_fields builder, :email).to have_tag('input', :with => { :name => "user[email]", :type => 'hidden'})
      expect(hidden_fields builder, :password).to have_tag('input', :with => { :name => "user[password]", :type => 'hidden'})
    end
  end
end
