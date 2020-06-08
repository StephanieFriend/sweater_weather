class Api::V1::TravelsController < ApplicationController

  def show
    render :json => { :food => "YUM!" }
  end
end
