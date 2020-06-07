class HourlyWeather

  def initialize(weather_info)
    @hour = Time.at(weather_info[:dt]).strftime('%I %p')
    @temp = weather_info[:temp]
    @description = weather_info[:weather][0][:main]
  end

  def self.hour_forecast(weather_info)
    hour_array = []
    weather_info[:hourly][1..8].each do |hour|
      hour_array << HourlyWeather.new(hour)
    end
    hour_array
  end
end
