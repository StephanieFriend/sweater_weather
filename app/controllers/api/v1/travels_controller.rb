class Api::V1::TravelsController < ApplicationController

  def show
    render :json => TravelSerializer.new(Travel.new(params[:start], params[:end], params[:search]))
  end
end
