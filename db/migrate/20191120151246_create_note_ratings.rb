class CreateNoteRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :note_ratings do |t|
      t.float :value
      t.references :class_note, foreign_key: true

      t.timestamps
    end
  end
end
