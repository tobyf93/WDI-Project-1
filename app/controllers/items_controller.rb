class ItemsController < ApplicationController
  def index
  end

  def create
    file_path = params[:file].file_path
    Cloudinary::Uploader.upload(file_path)
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
