class CoursesController < ApplicationController
  def index
    if params[:query]
      @courses = policy_scope(Course).search(params[:query], fields: [:name], match: :word_middle)
    else
      @courses = policy_scope(Course)
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
