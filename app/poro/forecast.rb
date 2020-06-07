class Forecast
  attr_reader :id

  def initialize(location)
    @google = GoogleServices.get_json(location)
    @google_json = Google.new(@google)
    @weather_info = ForecastServices.get_json(@google_json.lat, @google_json.lng)
    @id = location
  end

  def weather_forecast
    {
        :main => MainContent.main_forecast(@weather_info),
        :details => CurrentDetails.detail_forecast(@weather_info),
        :hourly => HourlyWeather.hour_forecast(@weather_info),
        :daily => DailyWeather.day_forecast(@weather_info)
    }
  end
end
