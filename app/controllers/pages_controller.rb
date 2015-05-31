class PagesController < ApplicationController
  def home
  end

  def discover
    gon_googlemaps
  end
end
