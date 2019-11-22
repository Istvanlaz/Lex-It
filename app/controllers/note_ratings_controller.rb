class NoteRatingsController < ApplicationController
  skip_after_action :verify_authorized, except: [:index, :create], unless: :skip_pundit?
  skip_after_action :verify_policy_scoped, only: [:index, :create], unless: :skip_pundit?
  def new
    @class_note = ClassNote.find(params[:class_note_id])
    @note_rating = NoteRating.new
  end

  def edit
    # @note_rating = note_rating.find(params[:class_note_id])
  end

  def create
    @class_note = ClassNote.find(params[:class_note_id])
    @note_rating = NoteRating.new(note_rating_params)
    @note_rating.class_note = ClassNote.find(params[:class_note_id])
    if @note_rating.save!
      redirect_to domain_courses_path(@class_note.course.domain_id)
    else
      render :new
    end
  end

  private

  def note_rating_params
    params.require(:note_rating).permit(:value, :class_note_id, :user_id)
  end
end
