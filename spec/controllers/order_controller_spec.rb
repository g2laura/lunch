require 'spec_helper'

RSpec.describe OrderController, :type => :controller do

  include Devise::TestHelpers

  let(:user)       { FactoryGirl.create :user }
  let(:restaurant) { FactoryGirl.create :restaurant }
  let(:item)       { FactoryGirl.create :item }

  before(:each) {
    sign_in user
  }

  describe "GET new" do
    it "returns http success" do
      post :create, { restaurant_id: restaurant.id, item_id: item.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET user_orders" do
    it "returns http success" do
      get :user_orders, { restaurant_id: restaurant.id }
      expect(response).to have_http_status(:success)
    end
  end

end
