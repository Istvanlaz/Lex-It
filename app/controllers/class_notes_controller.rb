class ClassNotesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def my_notes
    @notes = current_user.class_notes
    authorize @notes
  end
end
