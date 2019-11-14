class Course < ApplicationRecord
  belongs_to :domain
  has_many :class_notes, dependent: :destroy
  has_many :registrations, dependent: :destroy
  mount_uploader :image, PhotoUploader
end
