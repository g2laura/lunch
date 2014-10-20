require 'spec_helper'

RSpec.describe RestaurantsHelper do

  describe '#image_url' do
    it 'returns a placehold.it with the restaurant name' do
      restaurant = Restaurant.create(name: 'test')
      expect(image_url(restaurant)).to eq('http://placehold.it/250x200&text=test')
    end
    it 'returns an image url' do
      restaurant = FactoryGirl.create :restaurant
      expect(image_url(restaurant)).to eq(restaurant.image.url(:thumb).to_s)
    end
  end

  describe '#card_image_div' do
    it 'returns a div with the classes card and image' do
      restaurant = FactoryGirl.create :restaurant
      user = FactoryGirl.create :user
      expect(card_image_div(restaurant, user)).to have_tag('div', :with => { :class => 'card image', :onclick => 'vote(' + restaurant.id.to_s + ');'})
    end
  end

end
