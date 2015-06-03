class UsersController < ApplicationController
  before_action :authorize_admin, :except => [:new]

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
    gon_googlemaps
    gon.draggable = true
  end

  def set_location
    use_geoloc = params[:use_geoloc]? true : false
    @current_user.use_geoloc = use_geoloc
    @current_user.latitude = params[:latitude]
    @current_user.longitude = params[:longitude]

    @current_user.save
    redirect_to discover_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
