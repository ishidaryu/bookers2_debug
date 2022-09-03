class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:update, :edit]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def edit
      @user = User.find(params[:id])
      if @user == current_user
      render :edit
      else
      @users = User.all
      @user = current_user
      redirect_to user_path(current_user.id)
      end
  end

  def update
      @user =  User.find(params[:id])
      if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path(@user)
      else
      render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user)
    unless @user == current_user
    end
  end
end