class PagesController < ApplicationController
  def home
  end

  def discover
    @items = Item.all
    gon_googlemaps
  end
end
