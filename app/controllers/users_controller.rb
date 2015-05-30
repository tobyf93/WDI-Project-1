class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    user = User.create user_params
    redirect_to user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find params[:id]
  end

  def update
  end

  def destroy
  end

  def new_location
  end

  def set_location
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
