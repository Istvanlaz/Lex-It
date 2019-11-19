class Notenote_ratingsController < ApplicationController
  skip_after_action :verify_authorized, except: :index, unless: :skip_pundit?
  skip_after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  def new
    @class_note = Class_note.find(params[:class_note_id])
    @note_rating = Note_rating.new
  end

  def edit
    # @note_rating = note_rating.find(params[:class_note_id])
  end

  def create
    @class_note = Class_note.find(params[:class_note_id])
    @note_rating = Note_rating.new(note_rating_params)
    @note_rating.class_note = @class_note
    if @note_rating.save
      redirect_to domain_class_note_path(@class_note)
    else
      render :new
    end
  end

  private

  def note_rating_params
    params.require(:note_rating).permit(:note_rating, :class_note_id, :domain_id)
  end
end
