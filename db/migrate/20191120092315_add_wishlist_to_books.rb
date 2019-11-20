class AddWishlistToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :wishlist, :boolean
  end
end
