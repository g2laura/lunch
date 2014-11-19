class Item < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders
  has_many :users, through: :orders
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }

  scope :total_by_user, ->(restaurant, user) { joins(:orders).where("orders.restaurant_id = ? AND orders.user_id = ?", restaurant.id, user.id).sum(:price) }

  scope :total_by_restaurant, ->(restaurant) { joins(:orders).where("orders.restaurant_id = ? ", restaurant.id).sum(:price) }

  def self.is_within_budget?(restaurant, user, item)
    total = self.total_by_user(restaurant, user) + item.price
    if (total < 7.70) || total.between?(7.69, 9.00)
      true
    elsif total > 9.00
      false
    end
  end

  def self.within_budget_message(restaurant, user, item)
    total = self.total_by_user(restaurant, user) + item.price
    if total.between?(7.69, 9.00)
      "The budget is $7.69 .. but we added your order."
    elsif total > 9.00
      "You are too over the budget ($7.69). The order wasn't added."
    end
  end

end
