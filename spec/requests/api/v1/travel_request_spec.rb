require 'rails_helper'

RSpec.describe 'Travel API' do
  before do
    VCR.configure do |c|
      @previous_allow_http_connections = c.allow_http_connections_when_no_cassette?
      c.allow_http_connections_when_no_cassette = true
    end
  end

  after do
    VCR.configure do |c|
      c.allow_http_connections_when_no_cassette = @previous_allow_http_connections
    end
  end

  it 'I enter a city and receive travel info' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.class).to eq(Hash)
    # binding.pry
  end
end

# You will build an endpoint that will retrieve food and forecast information for a destination city.
#     ​
# Your endpoint should follow this format:
# `GET /api/v1/foodie?start=denver,co&end=pueblo,co&search=italian`
#                                                                               ​
#  Your API will return:
# - the end city
# - estimated travel time
# - the name and address of a restaurant that matches the search parameter
# - the forecast at your time of arrival
# ​
# Your response should be similar to the format below:
#                                                   ​
# ```
# {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }
# ```