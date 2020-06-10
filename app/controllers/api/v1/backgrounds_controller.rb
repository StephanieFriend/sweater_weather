class Api::V1::BackgroundsController < ApplicationController

def index
    render :json =>  PhotoSerializer.new(Photo.new(params[:location]))
  end
end
