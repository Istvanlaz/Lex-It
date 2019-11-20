class ClassNote < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :ratings, dependent: :destroy
  has_one_attached :content
  mount_uploader :image, PhotoUploader

  def average_note_rating
    return 0 if note_ratings.empty?

    (note_ratings.map(&:note_rating).sum / note_ratings.count).round 2
  end
end
