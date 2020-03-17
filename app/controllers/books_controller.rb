class BooksController < ApplicationController

    before_action :authenticate_user!

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
		@users = User.all
	end
	def create
		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user
		@users = User.all
		if @book.save
		flash[:notice] = "You have created book successfully."
		redirect_to book_path(@book.id)
		else
		render :index
		end

	end
	def show
		@book = Book.find(params[:id])
		@user = current_user
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		flash[:notice] = "You have updated book successfully."
		redirect_to book_path(@book.id)
		else
		render :edit
		end
	end

	private
	def book_params
  	params.require(:book).permit(:title, :body)
    end
end
