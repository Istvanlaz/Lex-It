class ClassNote < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :note_ratings, dependent: :destroy
  has_many :savings, dependent: :destroy
  has_many :wishlists, through: :savings

  has_one_attached :content


  mount_uploader :image, PhotoUploader

  validates_associated :course

  def average_note_rating
    return 0 if note_ratings.empty?

    (note_ratings.map(&:value).sum / note_ratings.count).round 2
  end
end
