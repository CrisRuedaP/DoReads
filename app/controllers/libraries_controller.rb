class LibrariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  
  def index
    @library = Library.find(params[:id])
  end

end
