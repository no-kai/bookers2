class UsersController < ApplicationController


  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to users_path
    end
  end

  def update
    user = User.find(params[:id])
    @user = user

    if user.update(user_params)
      flash[:notice] = 'Profile was successfully update'
      redirect_to user_path(@user.id)
    else
      @user = user
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
