class Item < ActiveRecord::Base
  belongs_to :menu
  acts_as_taggable_on :categories
end
