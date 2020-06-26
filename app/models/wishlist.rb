class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :savings
  has_many :class_notes, through: :savings
end
