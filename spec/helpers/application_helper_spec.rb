require "spec_helper"

class TestHelper < ActionView::Base; end

describe ApplicationHelper do
  let(:helper)   { TestHelper.new }
  let(:user)     { FactoryGirl.build :user }
  let(:builder)  { ActionView::Helpers::FormBuilder.new :user, user, helper, {}, nil }

  describe "#hidden_fields" do
    it "render the form hidden fields" do
      expected_fields = "<input id=\"user_email\" name=\"user[email]\" type=\"hidden\" value=\"#{user.email}\" />" +
        "<input id=\"user_password\" name=\"user[password]\" type=\"hidden\" value=\"#{user.password}\" />"

      expect(hidden_fields builder, :email, :password).to include expected_fields
    end
  end
end
