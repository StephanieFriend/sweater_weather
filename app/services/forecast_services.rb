class ForecastServices

  def self.get_json(lat, lon)
    response = Faraday.get('https://api.openweathermap.org/data/2.5/onecall') do |req|
      req.params[:appid] = ENV['FORECAST_API_KEY']
      req.params[:lat] = lat
      req.params[:lon] = lon
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
