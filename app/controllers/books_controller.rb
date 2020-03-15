class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
	end
	def create
		@book = Book.new
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
	def show
	end
end
