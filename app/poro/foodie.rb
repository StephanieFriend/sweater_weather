class Foodie
  attr_reader :id

  def initialize(start, ending, search)
    @id = nil
    @direction = DirectionServices.get_json(start, ending)
    @google = GoogleServices.get_json(ending)
    @google_json = Google.new(@google)
    @food = ZomatoServices.get_json(@google_json.lat, @google_json.lng, search)
    @weather_info = ForecastServices.get_json(@google_json.lat, @google_json.lng)
  end

  def foodie
    {
        :travel_time =>  Distance.new(@direction),
        :forecast =>  forecast_info(@weather_info),
        :restaurant => address_formatting(@food)
    }
  end

  def address_formatting(food_info)
    food_info = Food.new(@food)
    food_info.address_formatting
  end

  def forecast_info(weather_info)
    forecast = MainContent.new(weather_info)
    {
        :summary => forecast.current_description,
        :temperature => forecast.current_temp
    }
  end
end