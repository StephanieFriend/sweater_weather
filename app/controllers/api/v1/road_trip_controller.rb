class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: road_trip_params[:api_key])

    error_message = "Must use a valid API key for request"
    if user
      road_trip = user.road_trips.create(road_trip_params)
      rts = RoadTripResponse.new(road_trip.id, road_trip.origin, road_trip.destination, nil)
      rts.initialize_external_data(DirectionServices.get_json(road_trip.origin, road_trip.destination),
                                   Google.new(GoogleServices.get_json(road_trip.destination)))
      render :json => RoadTripSerializer.new(rts),
             status: :ok
    else
      render :json => RoadTripSerializer.new(RoadTripResponse.new(nil, nil, nil, error_message)),
             status: :unauthorized
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
