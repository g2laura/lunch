class Item < ActiveRecord::Base
  belongs_to :restaurant
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0}
end
