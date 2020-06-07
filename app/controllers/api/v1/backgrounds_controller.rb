class Api::V1::BackgroundsController < ApplicationController


def index
    location = {:location =>
                    Photo.return_image(params[:location])
    }

    render :json => location
  end
end
