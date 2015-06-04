class PagesController < ApplicationController
  before_action :authorize_user, :only => [:discover]

  def home
    redirect_to discover_path if @current_user
  end

  def discover
    @items = []
    user_location = get_user_location

    if user_location.present?
      @items = Item.near(user_location, 0.1, :units => :km)
    end

    gon_googlemaps
  end
end
