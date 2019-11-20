class ClassNotesController < ApplicationController
  def index
  end

  def show
    @class_note = ClassNote.find(params[:id])
  end

  def new
    authorize @class_note = ClassNote.new
  end

  def edit
    authorize @class_note = ClassNote.find(params[:id])
  end

  def create
    authorize @class_note = ClassNote.new(class_note_params)
    @class_note.user = current_user
    if @class_note.save
      redirect_to domain_courses_path(@class_note.course.domain_id)
    else
      render :new
    end
  end

  def update
    authorize @class_note = ClassNote.find(params[:id])
    if @class_note.update(class_note_params)
      redirect_to domain_course_class_notes_path
    else
      # @class_note.errors
      render :new
    end
  end

  def destroy
    authorize @class_note = ClassNote.find(params[:id])
    @class_note.destroy
    redirect_to domain_courses_path(@class_note.course.domain_id)
  end

  private

  def set_domain
    @domain = Domain.find params[:domain_id]
  end

  def class_note_params
    params.require(:class_note).permit(:course_id, :user_id, :title, :author, :click_counter, :image, :domain_id, :content)
  end

  def my_notes
    @notes = current_user.class_notes
    authorize @notes
  end
end
