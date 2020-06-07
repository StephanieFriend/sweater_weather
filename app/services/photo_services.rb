class PhotoServices

  def self.get_json(location)
    response = Faraday.get('https://api.unsplash.com/search/photos') do |req|
      req.headers[:Authorization] = ENV['PHOTO_API_KEY']
      req.params[:query] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
