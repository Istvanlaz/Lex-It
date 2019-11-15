class Domain < ApplicationRecord
  has_many :courses, dependent: :destroy
  mount_uploader :image, PhotoUploader
  has_many :books
end
