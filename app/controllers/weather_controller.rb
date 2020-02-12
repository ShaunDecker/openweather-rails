class WeatherController < ApplicationController
  def index
    if params[:q]
      @weather = Request.get_json(params[:q])
    else
      @weather = "Enter a city to get its current weather"
    end

    respond_to do |format|
      format.js
      format.html
    end
  end
end
