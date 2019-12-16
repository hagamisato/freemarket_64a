class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :commnets
  has_many :items, through: :user_items
  has_many :user_items
  has_one :address
  accepts_nested_attributes_for :address
  # has_one :credit_card
  # accepts_nested_attributes_for :credit_card

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end