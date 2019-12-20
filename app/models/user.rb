class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :commnets
  has_many :items, through: :user_items
  has_many :user_items
  has_one :address
  has_one :card
  accepts_nested_attributes_for :address
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end