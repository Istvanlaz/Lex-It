class Book < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_one_attached :resume
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true
  # validate :resume_attached?
  validates :resume, content_type: :pdf
  mount_uploader :image, PhotoUploader

  belongs_to :domain
  belongs_to :user
  searchkick word_middle: [:name]

  def average_rating
    return 'Be the first to rate' if ratings.empty?

    (ratings.map(&:rating).sum / ratings.count).round 2
  end

  def resume_attached?
    return errors.add(:resume, "Must add a Resume") unless resume.attached?
  end
end
