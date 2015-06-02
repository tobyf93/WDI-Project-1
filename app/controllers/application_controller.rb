class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate, :create_gon_hash

  def gon_googlemaps
    gon._enabled = true
    gon.items = []
    gon.iconPath = ActionController::Base.helpers.asset_path 'star.png'

    encodedLocation = cookies[:location];

    if encodedLocation.present?
      location_str = Base64.decode64(cookies[:location]);
      coords = location_str.split(',');
      gon.userPos = {:lat => coords[0].to_f, :lng => coords[1].to_f}
    end

    if @current_user.use_geoloc?
      gon.userPos = {:lat => @current_user.latitude, :lng => @current_user.longitude}
    end

    Item.all.each do |item|
      gon.items << {:lat => item.latitude, :lng => item.longitude}
    end
  end

  private
  def authenticate
    @current_user = User.find session[:user_id] if session[:user_id]
  end

  # Forces gon object to be created for javascript.  Javascript files should check
  # this flag before attempting to use gon.
  def create_gon_hash
    gon._enabled = false
  end
end
