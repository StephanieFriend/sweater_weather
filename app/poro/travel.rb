class Travel
  attr_reader :id

  def initialize(start, ending, search)
    @id = nil
    @start = start
    @ending = ending
    @direction = DirectionServices.get_json(@start, @ending)
    @google = GoogleServices.get_json(@ending)
    @google_json = Google.new(@google)
    @food = ZomatoServices.get_json(@google_json.lat, @google_json.lng, search)
    @weather_info = ForecastServices.get_json(@google_json.lat, @google_json.lng)
    binding.pry
  end

  def travel_info
    {
        :end_location => @ending,
        :travel_time =>  Distance.new(@direction),
        :forecast =>  forecast_info(@weather_info),
        :restaurant => Food.new(@food)
    }
  end

  def forecast_info(info)
    binding.pry
  end
end