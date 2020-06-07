class HourlyWeather

  def initialize(weather_info)
    @hour = timestamp_to_hour(weather_info[:dt])
    @temp = kelvin_to_fahrenheit(weather_info[:temp])
    @description = weather_info[:weather][0][:main]
  end

  def self.hour_forecast(weather_info)
    hour_array = []
    weather_info[:hourly][1..8].each do |hour|
      hour_array << HourlyWeather.new(hour)
    end
    hour_array
  end

  def timestamp_to_hour(timestamp)
    hour = Time.at(timestamp).strftime('%H')
    if hour.to_i > 12
      (hour.to_i - 12).to_s + "PM"
    else
      hour + "AM"
    end
  end

  def kelvin_to_fahrenheit(kelvin)
    (((kelvin - 273.15) * (9/5)) + 32).round(2)
  end
end
