require 'rspec-rails'

RSpec.describe 'Location API', :vcr do
  it 'can return daily content' do
   get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.class).to eq(Hash)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily].count).to eq(5)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0]).to have_key :day
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0]).to have_key :description
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0]).to have_key :precip
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0]).to have_key :high_temp
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0]).to have_key :low_temp
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0][:day].class).to eq(String)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0][:description].class).to eq(String)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0][:precip].class).to eq(Float)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0][:high_temp].class).to eq(Float)
    expect(json[:location][:data][:attributes][:weather_forecast][:daily][0][:low_temp].class).to eq(Float)
  end
end
