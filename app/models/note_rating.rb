class NoteRating < ApplicationRecord
  belongs_to :class_note
  validates :rating, inclusion: { in: 0..5 }, numericality: true
end
