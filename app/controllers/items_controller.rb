class ItemsController < ApplicationController
  before_action :authorize_user

  def index
    @user = @current_user
  end

  def create
    # Get uploaded file and push it to Cloudinary
    file = params[:file]
    cl_info = Cloudinary::Uploader.upload(file.path)

    if cl_info
      user_coords = get_user_location.split(',')
      file_name = file.original_filename
      file_name = params[:file_name] if params[:file_name].present?

      item = Item.new
      item.name = file_name
      item.media_type = file.content_type
      item.latitude = user_coords[0]
      item.longitude = user_coords[1]
      item.user_id = @current_user.id
      item.cl_id = cl_info['public_id']
      item.save
    end

    redirect_to discover_path
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    item = Item.find params[:id]
    item.destroy if item.user.id == @current_user.id
    redirect_to discover_path
  end
end
