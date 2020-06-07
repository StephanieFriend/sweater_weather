class DailyWeather

  def initialize(weather_info)
    @day = Time.at(weather_info[:dt]).strftime('%A')
    @description = weather_info[:weather][0][:main]
    @precip = calc_precip(weather_info)
    @high_temp = weather_info[:temp][:max]
    @low_temp = weather_info[:temp][:min]
  end

  def self.day_forecast(weather_info)
    day_array = []
    weather_info[:daily][1..5].each do |day|
      day_array << DailyWeather.new(day)
    end
    day_array
  end

  def calc_precip(weather_info)
    air_drops = 0
    return air_drops + weather_info[:rain] if weather_info[:rain]
    return air_drops + weather_info[:snow] if weather_info[:snow]
    air_drops
  end
end
