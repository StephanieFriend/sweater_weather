require 'rspec-rails'

RSpec.describe 'Location API', :vcr do
  it 'can return detailed content' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    details = json[:data][:attributes][:weather_forecast][:details]

    expect(json.class).to eq(Hash)
    expect(details[0]).to have_key :description
    expect(details[0]).to have_key :sunrise
    expect(details[0]).to have_key :sunset
    expect(details[0]).to have_key :feels_like
    expect(details[0]).to have_key :humidity
    expect(details[0]).to have_key :visibility
    expect(details[0]).to have_key :uv_index
    expect(details[0][:description].class).to eq(String)
    expect(details[0][:sunrise].class).to eq(String)
    expect(details[0][:sunset].class).to eq(String)
    expect(details[0][:feels_like].class).to eq(Float)
    expect(details[0][:humidity].class).to eq(Integer)
    expect(details[0][:uv_index].class).to eq(Float)
  end
end
