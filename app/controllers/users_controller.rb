class UsersController < ApplicationController

  def index
    @book = Book.new
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

end
