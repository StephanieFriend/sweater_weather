require 'rails_helper'

RSpec.describe 'Forecast Service', :vcr do
  it 'can receive coords and return forecast by city' do
    forecast = ForecastServices.get_json('39.7392358', '-104.990251')

    expect(forecast.class).to eq(Hash)
    expect(forecast[:lat]).to eq(39.74)
    expect(forecast[:lon]).to eq(-104.99)
    expect(forecast[:timezone]).to eq('America/Denver')
    expect(forecast).to have_key :current
    expect(forecast).to have_key :hourly
    expect(forecast).to have_key :daily
  end
end