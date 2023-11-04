class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :words

  validates :name, presence: true
end
