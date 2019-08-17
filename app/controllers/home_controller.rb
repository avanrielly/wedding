class HomeController < ApplicationController
  def index
  end

  def view
    if request.path == '/story'
      render 'story'
    elsif request.path == '/altitude'
      render 'altitude'
    elsif request.path == '/wedding'
      render 'wedding'
    elsif request.path == '/weekend'
      render 'weekend'
    elsif request.path == '/registry'
      render 'registry'
    end
  end
end
