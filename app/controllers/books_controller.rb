class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_book, only: [:show, :edit, :update]

  def index
    @pagy, @books = pagy(Book.all)
  end


  def new
    @book = Book.new
  end


  def create
    @book = current_user.books.build(book_params)
    if @book.save
      return redirect_to current_user, notice: t(".notice")
    end

    render :new
  end


  def update
    @book = Book.find params[:id]

    if @book.update book_params
      return redirect_to @book, notice: t(".notice")
    end

    render :edit
  end


  def destroy
    @book = Book.find params[:id]
    @book.destroy
    redirect_to book_path, notice: t(".notice")
  end


  def show; end

  def edit; end

  
  private

  def book_params
    params.require(:book).permit(:title, :author, :thumbnail, :description, :state  )
    #params.require(:book).permit(:title, :isbn, :author, :thumbnail, :description, :state ) - Google books api
  end

  def set_book
    @book = Book.find params[:id]
  end

end
