class CurrentDetails

  def initialize(weather_info)
    @description = weather_info[:current][:weather][0][:main]
    @sunrise = Time.at(weather_info[:current][:sunrise]).to_time
    @sunset = Time.at(weather_info[:current][:sunset]).to_time
    @feels_like = kelvin_to_fahrenheit(weather_info[:current][:feels_like])
    @humidity = weather_info[:current][:humidity]
    @visibility = weather_info[:current][:visibility]
    @uv_index = weather_info[:current][:uvi]
  end

  def self.detail_forecast(weather_info)
    detail_array = []
    detail_array << CurrentDetails.new(weather_info)
    detail_array
  end

  def kelvin_to_fahrenheit(kelvin)
    (((kelvin - 273.15) * (9/5)) + 32).round(2)
  end
end