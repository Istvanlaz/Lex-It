class CreateNoteRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :note_ratings do |t|
      t.integer :rating

      t.timestamps
    end
  end
end
