class RoadTripResponse
  attr_reader :id, :error_message

  def initialize(id, origin, destination, error_message)
    @id = id
    @origin = origin
    @destination = destination
    @error_message = error_message
    @direction = DirectionServices.get_json(origin, destination)
    @google = GoogleServices.get_json(destination)
    @google_json = Google.new(@google)
    @weather_info = ForecastServices.get_json(@google_json.lat, @google_json.lng)
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
