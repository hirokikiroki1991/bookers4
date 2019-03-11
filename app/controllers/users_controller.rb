class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books.all
    @book = Book.new
    @users = current_user

  end

  def edit
  	@user = User.find(params[:id])
    
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
  	  redirect_to user_path(@user.id)
    else
      # @user = current_user ←これがあるとバリデーションが通っちゃう
      @books = Book.all
      @book = Book.new
      render :edit

    end

  end


def index #下記のメソッドで、user.index.htmlを表示する
  @books = Book.all
  @book = Book.new
  @user = current_user
  @users = User.all
end




  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end



end