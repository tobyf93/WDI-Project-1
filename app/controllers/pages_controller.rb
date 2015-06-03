class PagesController < ApplicationController
  def home
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
