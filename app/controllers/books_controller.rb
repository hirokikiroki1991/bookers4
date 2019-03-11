class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

   def new
   	@book = Book.new
   	@books = Book.all
    @user = current_user

   end

   def create
   	@book = Book.new(book_params)
   	@book.user_id = current_user.id #asotiation
      if @book.save
       flash[:notice] = "Your post was successfully created"
       redirect_to book_path(@book.id)
      else
       @user = current_user
       # @book = Book.new(book_params)
       @books = Book.all
       render :new

   end
   end

   def index
   	 @books = Book.all
     @book = Book.new
     @user = current_user
   end

   def show
     @book = Book.find(params[:id])
     @user = current_user
     @books = Book.new
   end

   def destroy
   	@book = Book.find(params[:id])
   	@book.destroy
   	redirect_to '/books/new'
   end

   def edit
     @book = Book.find(params[:id])
   end

   def update
     @book = Book.find(params[:id])
     @book.update(book_params)
     redirect_to book_path(@book.id)
   end


   def about
   end

   private
   
   def book_params
   params.require(:book).permit(:book_title, :book_comment)
   end

   private
  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to root_path
    end
  end


end
