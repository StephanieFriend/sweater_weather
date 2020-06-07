class Forecast

  def self.get_lat_lng(location)
    google = GoogleServices.get_json(location)
    google_json = Google.new(google)
    @weather_info = ForecastServices.get_json(google_json.lat, google_json.lng)
    weather_forecast
  end

  def self.weather_forecast
    {
        :main => MainContent.main_forecast(@weather_info),
        :details => CurrentDetails.detail_forecast(@weather_info),
        :hourly => HourlyWeather.hour_forecast(@weather_info),
        :daily => DailyWeather.day_forecast(@weather_info)
    }
  end
end
