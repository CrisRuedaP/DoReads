class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @pagy, @books = pagy(Book.all)
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new book_params
    if @book.save
      return redirect_to root_url, notice: t(".notice")
    end

    render :new
  end


  def edit; end

  def update
    @book = Book.find params[:id]

    if @book.update book_params
      return redirect_to @book, notice: t(".notice")
    end

    render :edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :thumbnail, :description, :state )
  end

  def set_book
    @book = Book.find params[:id]
  end

end
