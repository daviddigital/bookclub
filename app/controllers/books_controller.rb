class BooksController < ApplicationController
  def index
    @books = Book.order(title: :asc)
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end
end
