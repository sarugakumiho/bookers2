class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = @books.first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end