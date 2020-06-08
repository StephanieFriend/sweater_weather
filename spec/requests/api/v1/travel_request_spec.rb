require 'rails_helper'

RSpec.describe 'Foodie API' do
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
    travel_info = json[:data][:attributes][:travel_info]

    expect(json.class).to eq(Hash)
    expect(travel_info).to have_key :end_location
    expect(travel_info[:end_location]).to eq("pueblo,co")

    expect(travel_info).to have_key :travel_time
    expect(travel_info[:travel_time]).to have_key :distance
    expect(travel_info[:travel_time][:distance]).to eq("1 hour 48 mins")

    expect(travel_info).to have_key :forecast
    expect(travel_info[:forecast]).to have_key :summary
    expect(travel_info[:forecast]).to have_key :temperature
    expect(travel_info[:forecast][:summary].class).to eq(String)
    expect(travel_info[:forecast][:temperature].class).to eq(Float)

    expect(travel_info).to have_key :restaurant
    expect(travel_info[:restaurant]).to have_key :name
    expect(travel_info[:restaurant]).to have_key :address
    expect(travel_info[:restaurant]).to have_key :city
    expect(travel_info[:restaurant]).to have_key :zip
    expect(travel_info[:restaurant][:name].class).to eq(String)
    expect(travel_info[:restaurant][:address].class).to eq(String)
    expect(travel_info[:restaurant][:city].class).to eq(String)
    expect(travel_info[:restaurant][:zip].class).to eq(String)
  end
end
