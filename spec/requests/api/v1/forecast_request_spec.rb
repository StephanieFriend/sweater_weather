require 'rails_helper'

RSpec.describe 'Location API', :vcr do
  it 'can call out and retrieve all needed info' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    forecast = json[:data][:attributes][:weather_forecast]

    expect(forecast.class).to eq(Hash)
    expect(forecast).to have_key :main
    expect(forecast).to have_key :details
    expect(forecast).to have_key :hourly
    expect(forecast).to have_key :daily
    expect(forecast[:main].count).to eq(1)
    expect(forecast[:details].count).to eq(1)
    expect(forecast[:hourly].count).to eq(8)
    expect(forecast[:daily].count).to eq(5)
  end
end
