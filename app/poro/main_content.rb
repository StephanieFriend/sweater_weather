class MainContent

  def initialize(weather_info)
    @current_temp = weather_info[:current][:temp]
    @high_temp = weather_info[:daily][0][:temp][:max]
    @low_temp = weather_info[:daily][0][:temp][:min]
    @current_description = weather_info[:current][:weather][0][:main]
    @date_time = Time.at(weather_info[:current][:dt]).strftime('%I:%M %p, %B %d')
  end

  def self.main_forecast(weather_info)
    main_array = []
    main_array << MainContent.new(weather_info)
    main_array
  end
end
