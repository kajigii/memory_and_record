class Word < ApplicationRecord
  belongs_to :room
  belongs_to :user
end
