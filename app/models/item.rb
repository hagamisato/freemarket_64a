class Item < ApplicationRecord
  has_many :images 
  belongs_to :categories
  # accepts_nested_attributes_for :images, :categories
end
