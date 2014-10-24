class Item < ActiveRecord::Base
  belongs_to :restaurant
  acts_as_taggable_on :categories
end
