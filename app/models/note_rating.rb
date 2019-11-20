class NoteRating < ApplicationRecord
  belongs_to :class_note
  validates :value, inclusion: { in: 0..5 }, numericality: true
end
