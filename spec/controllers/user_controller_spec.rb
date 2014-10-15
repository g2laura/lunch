require 'spec_helper'

RSpec.describe UserController, :type => :controller do

  include Devise::TestHelpers

  let(:user)    { FactoryGirl.create :user }
  before(:each) { sign_in user }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
