class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :words
  # belongs_to :user

  validates :name, presence: true
end
