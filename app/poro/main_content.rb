class MainContent

  def initialize(weather_info)
    @current_temp = kelvin_to_fahrenheit(weather_info[:current][:temp])
    @high_temp = kelvin_to_fahrenheit(weather_info[:daily][0][:temp][:max])
    @low_temp = kelvin_to_fahrenheit(weather_info[:daily][0][:temp][:min])
    @current_description = weather_info[:current][:weather][0][:main]
    @date_time = Time.at(weather_info[:current][:dt]).to_datetime
  end

  def self.main_forecast(weather_info)
    main_array = []
    main_array << MainContent.new(weather_info)
    main_array
  end

  def kelvin_to_fahrenheit(kelvin)
    (((kelvin - 273.15) * (9/5)) + 32).round(2)
  end
end