class Travel
  attr_reader :id

  def initialize(start, ending, search)
    @id = nil
    @start = start
    @end = ending
    @direction = DirectionServices.get_json(@start, @end)
    @google = GoogleServices.get_json(@end)
    @google_json = Google.new(@google)
    @food = ZomatoServices.get_json(@google_json.lat, @google_json.lng, search)
    @weather_info = ForecastServices.get_json(@google_json.lat, @google_json.lng)
  end

  def travel_info
    {
        :end_location => @end,
        :travel_time =>  Distance.new(@direction),
        :forecast =>  forecast_info(@weather_info),
        :restaurant => Food.new(@food)
    }
  end

  def forecast_info(weather_info)
    forecast = MainContent.new(weather_info)
    {
        :summary => forecast.current_description,
        :temperature => forecast.current_temp
    }
  end
end