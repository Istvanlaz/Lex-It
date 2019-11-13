class CreateClassNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :class_notes do |t|
      t.string :title
      t.string :author
      t.integer :click_counter
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
