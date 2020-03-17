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

    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
    else
       render :edit
    end

  end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
