class RoadTripResponse
  attr_reader :id, :error_message

  def initialize(id, origin, destination, error_message)
    @id = id
    @origin = origin
    @destination = destination
    @error_message = error_message
  end

  def initialize_external_data(direction, google)
    @direction = direction
    @weather_info = ForecastServices.get_json(google.lat, google.lng)
  end

  def road_trip
    {
        :origin => @origin,
        :destination => @destination,
        :travel_time => Distance.new(@direction),
        :arrival_forecast => weather_summary(@weather_info)
    }
  end

  def weather_summary(weather_info)
    forecast = MainContent.new(weather_info)
    {
        :summary => forecast.current_description,
        :temperature => forecast.current_temp
    }
  end
end
