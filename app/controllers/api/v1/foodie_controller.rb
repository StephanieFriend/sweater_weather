class Api::V1::FoodieController < ApplicationController

  def show
    render :json => FoodieSerializer.new(Foodie.new(params[:start], params[:end], params[:search]))
  end
end
