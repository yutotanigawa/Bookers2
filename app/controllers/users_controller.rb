class UsersController < ApplicationController

    before_action :authenticate_user!
     before_action :correct_user, only: [:edit, :update]

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

    private
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end
