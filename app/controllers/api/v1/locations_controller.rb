class Api::V1::LocationsController < ApplicationController

  def index
    location = {:location =>
                    ForecastSerializer.new(Forecast.new(params[:location]))
     }

    render :json => location
  end
end
