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
      item.name = file.original_filename
      item.media_type = file.content_type
      item.latitude = @current_user.latitude
      item.longitude = @current_user.longitude
      item.user_id = @current_user.id
      item.save
    end
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
