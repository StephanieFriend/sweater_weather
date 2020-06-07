class Api::V1::LocationsController < ApplicationController

  def index
    location = {:location =>
                    Forecast.get_lat_lng(params[:location])
     }

    render :json => location
  end
end
