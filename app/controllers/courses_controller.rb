class CoursesController < ApplicationController
  def index
    if params[:query]
      @courses = policy_scope(Course).search(params[:query], fields: [:name], match: :word_middle)
    else
      @courses = policy_scope(Course)
    end
    @class_note = ClassNote.new
    @domain = Domain.find(params[:domain_id])
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    authorize @course = Course.new
  end

  def edit
    authorize @course = Course.find(params[:id])
  end

  def create
    authorize @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to domain_courses_path, notice: "Class Note was Created"
    else
      render :new
    end
  end

  def update
    authorize @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to domain_courses_path, notice: "Class Note was Updated"
    else
      # @course.errors
      render :new
    end
  end

  def destroy
    authorize @course = Course.find(params[:id])
    @course.destroy
    redirect_to domain_courses_path, notice: "Class Note was Destroyed"
  end

  private

  def set_domain
    @domain = Domain.find params[:domain_id]
  end

  def course_params
    params.require(:course).permit(:name, :user, :image, :domain_id)
  end
end
