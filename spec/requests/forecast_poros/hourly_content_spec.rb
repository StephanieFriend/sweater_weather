require 'rspec-rails'

RSpec.describe 'Location API', :vcr do
  it 'can return hourly content' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    hourly = json[:data][:attributes][:weather_forecast][:hourly]

    expect(json.class).to eq(Hash)
    expect(hourly.count).to eq(8)
    expect(hourly[0]).to have_key :hour
    expect(hourly[0]).to have_key :temp
    expect(hourly[0]).to have_key :description
    expect(hourly[0][:hour].class).to eq(String)
    expect(hourly[0][:temp].class).to eq(Float)
    expect(hourly[0][:description].class).to eq(String)
  end
end
