class Book < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_one_attached :resume
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :author, presence: true
  validates :publishing_year, presence: true
  # validate :resume_attached?
  validates :resume, attached: true, content_type: :pdf
  mount_uploader :image, PhotoUploader

  belongs_to :domain
  belongs_to :user

  def average_rating
    return 0 if ratings.empty?

    (ratings.map(&:rating).sum / ratings.count).round 2
  end

  def resume_attached?
    return errors.add(:resume, "must add an resume") unless resume.attached?
  end
end
