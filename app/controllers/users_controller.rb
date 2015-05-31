class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.create user_params

    if @user && @user.save
      redirect_to root_path
    else
      render :new
    end
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
    # Setup javascript data
    gon.items = []
    gon.iconPath = ActionController::Base.helpers.asset_path 'star.png'
    gon.userPos = {:lat => @current_user.latitude, :lng => @current_user.longitude}

    Item.all.each do |item|
      gon.items << {:lat => item.latitude, :lng => item.longitude}
    end
  end

  def set_location
    @current_user.latitude = params[:latitude]
    @current_user.longitude = params[:longitude]
    @current_user.save
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
