class ClassNote < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one_attached :content
  mount_uploader :image, PhotoUploader
end
