class Restaurant < ActiveRecord::Base
  has_many :users
  acts_as_taggable_on :categories

  mount_uploader :image, ImageUploader
end
