class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :restaurant

  scope :lunch_by_user, ->(restaurant, user) { where restaurant: restaurant, user: user }
end
