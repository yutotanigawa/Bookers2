class UsersController < ApplicationController

    before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
  	@book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def index
  	@users = User.all
  	@book = Book.new
  	@user = current_user
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
