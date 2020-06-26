class WishlistsController < ApplicationController
  def index
    list = policy_scope(Wishlist)
    @wishlist = list.nil? ? Wishlist.create(user: current_user) : list
    @notes = @wishlist.class_notes
  end
end
