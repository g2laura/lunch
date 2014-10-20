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

  describe "#flash_class" do
    it "returns an alert-info if flash level is notice" do
      expect(flash_class(:notice)).to eq("alert alert-info")
    end
    it "returns an alert-success if flash level is success" do
      expect(flash_class(:success)).to eq("alert alert-success")
    end
    it "returns an alert-danger if flash level is error" do
      expect(flash_class(:error)).to eq("alert alert-danger")
    end
    it "returns an alert-warning if flash level is alert" do
      expect(flash_class(:alert)).to eq("alert alert-warning")
    end
  end
end
