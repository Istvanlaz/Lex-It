class WishlistsController < ApplicationController
  def index
    list = policy_scope(Wishlist)
    @wishlist = list.empty? ? Wishlist.create(user: current_user) : list
    @notes = @wishlist.first.class_notes
  end
end
