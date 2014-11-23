class Restaurant < ActiveRecord::Base
  has_many :users
  has_many :items
  has_many :orders
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  validates :name, :phone_number, presence: true

  scope :ordered_by_votes_and_office, ->(office) {
    find_by_sql("SELECT restaurants.*, COUNT(users.restaurant_id) AS votes FROM restaurants LEFT JOIN users ON users.restaurant_id = restaurants.id AND users.office = \"#{office}\" GROUP BY restaurants.id ORDER BY votes DESC")
  }

  scope :votes_by_office, ->(office) { joins(:users).where("users.office = ?", office) }

  scope :votes_by_restaurant_and_office, ->(restaurant, office) { joins(:users).where("restaurants.id = ? AND users.office = ?", restaurant.id, office) }

end
