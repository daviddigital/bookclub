class BooksController < ApplicationController
  before_action :set_authors_and_genres, only: [:new, :edit]
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def new
    @book = Book.new
  end

  def index
    @books = Book.order(title: :asc)
  end

  def create
    # render json: params
    @book = Book.new(book_params)
    begin
      @book.save!
      redirect_to @book
    rescue 
      # render json: @book.errors.full_messages
      render 'edit'
    end

  end

  def update
    @book.update(book_params)
    redirect_to @book
  end

  def edit
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def show
  end

  def new
  end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :author_id, :date_published, :publisher, genre_ids: [])

  end

  def set_authors_and_genres
    @authors = Author.order(:first_name)
    @genres = Genre.order(:genre)
  end 

  def set_book
    @book = Book.find(params[:id])  
  end
end
