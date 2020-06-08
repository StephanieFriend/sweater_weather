class ZomatoServices

  def self.get_json(lat, lon, type)
    response = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |req|
      req.headers[:user_key] = ENV['ZOMATO_API_KEY']
      req.params[:count] = 1
      req.params[:lat] = lat
      req.params[:lon] = lon
      req.params[:category]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end