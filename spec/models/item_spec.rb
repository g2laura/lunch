require 'spec_helper'

RSpec.describe Item, :type => :model do

  let(:restaurant) { FactoryGirl.create :restaurant }
  let(:item)       { FactoryGirl.create :item }
  let(:user)       { FactoryGirl.create :user }

  it 'calculate total price by user' do
    3.times { Order.create(restaurant: restaurant, user: user, item: item) }
    expect(Item.total_by_user(restaurant, user).to_i).to eq(24)
  end

  it 'verify that the new item is within budget' do
    expect(Item.is_within_budget?(restaurant, user, item)).to be(true)
  end

  it 'verify that the new item is not within budget' do
    item.update!(price: 10.00)
    expect(Item.is_within_budget?(restaurant, user, item)).to be(false)
  end
end
