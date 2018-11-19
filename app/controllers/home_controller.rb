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
    end
  end
end
