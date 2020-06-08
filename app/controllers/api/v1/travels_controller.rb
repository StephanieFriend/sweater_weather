class Api::V1::TravelsController < ApplicationController

  def show
    render :json => TravelSerializer.new(Travel.new(params[:start], params[:ending]))
  end
end
