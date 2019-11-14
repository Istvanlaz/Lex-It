class CoursesController < ApplicationController
  def index
    @courses = policy_scope(Course).select { |course| course.domain_id == params[:domain_id].to_i }
  end

  def show
  end

  def new
  end

  def edit
  end
end
