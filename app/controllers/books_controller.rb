class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth
  before_action :set_authors_and_genres, only: [:new, :edit, :create]
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def new
    @book = Book.new
  end

  def index
    # Book.send(Book.statuses.key(params[:query].to_i))
    case params[:query]
    when "in_stock"
      @books = Book.find_in_stock
    when "out_of_stock"
      @books = Book.out_of_stock
    when "banned"
      @books = Book.banned 
    else
      @books = Book.order(title: :asc)
    end
  end

  def create
    # render json: params
    @book = Book.new(book_params)
    @book.save
    redirect_to @book
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
    params.require(:book).permit(:title, :publisher, :author_id, :date_published, :cover, :publisher, genre_ids: [])

  end

  def set_authors_and_genres
    @authors = Author.order(:last_name)
    @genres = Genre.order(:genre)
  end 

  def set_book
    @book = Book.find(params[:id])  
  end

  def check_auth
    authorize Book 
  end
end
