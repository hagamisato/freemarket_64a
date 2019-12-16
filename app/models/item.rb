class Item < ApplicationRecord
  has_many :images
  has_many :categories
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories
  validates :name, {presence: true, length: {maximum: 40}}
  # mount_uploader :image, ImageUploader
end
