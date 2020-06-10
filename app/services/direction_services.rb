class DirectionServices

  def self.get_json(origin, destination)
    response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params[:key] = ENV['GOOGLE_API_KEY']
      req.params[:origin] = origin
      req.params[:destination] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end