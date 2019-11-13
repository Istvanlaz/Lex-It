class AddImageToClassNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :class_notes, :image, :string
  end
end
