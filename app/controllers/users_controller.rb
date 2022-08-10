class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      return redirect_to root_url, notice: t(".notice")
    end

    render :new 
  end

  def show
    @user = User.find(params[:id])
    @pagy, @user_books = pagy(@user.books)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
