class Item < ApplicationRecord
  has_many :images
  has_many :categories
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :categories
  validates :name, {presence: true, length: {maximum: 40}}
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :prefecture
  # active_hashが上手く行かなかったのでコメントアウト
end
