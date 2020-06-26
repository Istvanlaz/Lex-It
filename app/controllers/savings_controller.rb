class SavingsController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @class_note = ClassNote.find(params[:class_note_id])
    @wishlist = Wishlist.where(user: current_user).first
    authorize @saving = Saving.create(wishlist: @wishlist, class_note: @class_note)
    redirect_to domain_courses_path(@class_note.course.domain_id), notice: "Class Note was Added to Wishlist"
  end

  def destroy
    authorize @saving = Saving.find_by(wishlist_id: params[:id], class_note_id: params[:class_note_id])
    @saving.destroy
    redirect_to wishlists_path, notice: "Class Note was Deleted from Savings"
  end
end
