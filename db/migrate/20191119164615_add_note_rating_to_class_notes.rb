class AddNoteRatingToClassNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :note_ratings, :class_note, foreign_key: true
    add_column :note_ratings, :note_rating, :float
  end
end
