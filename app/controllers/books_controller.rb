class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new book_params
    if @book.save
      return redirect_to root_url, notice: t('.notice')
    end

    render :new
  end


  def edit
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :thumbnail, :description, :state )
  end

end
