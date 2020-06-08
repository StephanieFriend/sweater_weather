require 'rspec-rails'

RSpec.describe 'Location API', :vcr do
  it 'can return daily content' do
   get '/api/v1/forecast?location=denver,co'

   expect(response).to be_successful

   json = JSON.parse(response.body, symbolize_names: true)
   daily = json[:data][:attributes][:weather_forecast][:daily]

   expect(json.class).to eq(Hash)
   expect(daily.count).to eq(5)
   expect(daily[0]).to have_key :day
   expect(daily[0]).to have_key :description
   expect(daily[0]).to have_key :precip
   expect(daily[0]).to have_key :high_temp
   expect(daily[0]).to have_key :low_temp
   expect(daily[0][:day].class).to eq(String)
   expect(daily[0][:description].class).to eq(String)
   expect(daily[0][:precip].class).to eq(Float)
   expect(daily[0][:high_temp].class).to eq(Float)
   expect(daily[0][:low_temp].class).to eq(Float)
  end
end
