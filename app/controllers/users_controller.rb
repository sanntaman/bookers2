class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
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
    redirect_to user_path(current_user), notice:'You have updated user successfully.'
  else
    render :edit
  end
  end
  
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
