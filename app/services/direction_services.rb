class DirectionServices

  def self.get_json(start, ending)
    response = Faraday.get('https://maps.googleapis.com/maps/api/directions/json') do |req|
      req.params[:key] = ENV['GOOGLE_API_KEY']
      req.params[:origin] = start
      req.params[:destination] = ending
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
