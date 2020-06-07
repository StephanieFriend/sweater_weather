class Api::V1::BackgroundsController < ApplicationController


def index
    location = {:location =>
                    PhotoSerializer.new(Photo.new(params[:location]))
    }

    render :json => location
  end
end
