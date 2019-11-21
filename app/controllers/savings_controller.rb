class SavingsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @class_note = ClassNote.find(params[:class_note_id])
    @wishlist = Wishlist.where(user: current_user).first
    authorize @saving = Saving.create(wishlist: @wishlist, class_note: @class_note)
    redirect_to wishlists_path
  end

  def destroy
  end
end
