require 'spec_helper'

RSpec.describe Restaurant do

  describe 'scopes' do
    it 'orders restaurants by votes' do
      restaurant_with_5_votes = FactoryGirl.create :restaurant
      5.times do
        user = FactoryGirl.create :user
        user.restaurant = restaurant_with_5_votes
        user.save
      end

      restaurant_with_10_votes = FactoryGirl.create :restaurant
      10.times do
        user = FactoryGirl.create :user
        user.restaurant = restaurant_with_10_votes
        user.save
      end

      expect(Restaurant.ordered_by_votes_and_office(User::DORADO)).to eq([restaurant_with_10_votes, restaurant_with_5_votes])
    end
  end
end