class ItemsController < ApplicationController
  def index
    @user = @current_user
  end

  def create
    # Get uploaded file and push it to Cloudinary
    file = params[:file]
    cl_info = Cloudinary::Uploader.upload(file.path)

    if cl_info
      item = Item.new
      item.name = params[:file_name]
      item.media_type = file.content_type
      item.latitude = @current_user.latitude
      item.longitude = @current_user.longitude
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
  end
end
