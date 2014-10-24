class Restaurant < ActiveRecord::Base
  has_many :users
  has_many :items
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  scope :ordered_by_votes, -> {
    find_by_sql("SELECT restaurants.*, COUNT(users.id) AS votes FROM users, restaurants WHERE users.restaurant_id = restaurants.id OR users.restaurant_id IS NULL GROUP BY restaurants.id ORDER BY votes DESC")
  }
end
