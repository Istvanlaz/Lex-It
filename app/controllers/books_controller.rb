require 'open-uri'

class BooksController < ApplicationController
  skip_after_action :verify_authorized, except: [:index, :wishlist], unless: :skip_pundit?
  skip_after_action :verify_policy_scoped, only: [:index, :wishlist], unless: :skip_pundit?
  before_action :set_domain

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query"
      # we are going to refactor it when we will do the global search
      @books = Book.where(sql_query, query: "%#{params[:query]}%")
    else
      @books = policy_scope(@domain.books).order(created_at: :desc)
    end
    p @books
  end

  def show
    @book = Book.find(params[:id])

    # TODO !!
    # path = rails_blob_path(@book.resume, disposition: "attachement")
    # File.open(path, 'rb') do |io|
    #   reader = PDF::Reader.new(io)
    #   puts reader.info
    # end

    @review = Review.new
    @reviews = Review.all.where(book_id: @book.id)
  end

  def new
    authorize @book = Book.new
    set_domain
  end

  def edit
    authorize @book = Book.find(params[:id])
  end

  def create
    authorize @book = Book.new(book_params)
    @book.domain = @domain
    @book.user = current_user
    if @book.save!
      redirect_to domain_book_path(@domain.id, @book.id), notice: "Book was saved"
    else
      render :new
    end
  end

  def update
    authorize @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to domain_books_path
    else
      # @book.errors
      render :new
    end
  end

  def destroy
    authorize @book = Book.find(params[:id])
    @book.destroy
    redirect_to domain_books_path
  end

  def wishlist
    @wishlist_books = Book.where(wishlist: true)
  end

  def add_to_wishlist
    @book.wishlist = true
  end

  private

  def set_domain
    @domain = Domain.find params[:domain_id]
  end

  def book_params
    params.require(:book).permit(:title, :author, :publishing_year, :resume, :user, :image, :domain_id, :image_cache, :wishlist)
  end
end

