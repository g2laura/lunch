class Restaurant < ActiveRecord::Base
  has_many :users

  mount_uploader :image, ImageUploader
end
