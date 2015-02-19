class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :restaurant

  scope :lunch_by_user, ->(restaurant, user) { where restaurant: restaurant, user: user }

  scope :lunch_by_restaurant, ->(restaurant) { where restaurant: restaurant }

  scope :lunch_by_restaurant_and_office, ->(restaurant, office) { select("*").joins(:user).where("orders.restaurant_id = ? AND users.office = ?", restaurant.id, office).group('users.id') }

end
