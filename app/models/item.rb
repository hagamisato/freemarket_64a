class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :image
end