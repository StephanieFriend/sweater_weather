require 'rspec-rails'

RSpec.describe 'Location API', :vcr do
  it 'can return hourly content' do
  get '/api/v1/forecast?location=denver,co'

  expect(response).to be_successful

  @json = JSON.parse(response.body, symbolize_names: true)

  expect(@json.class).to eq(Hash)
    expect(@json[:location][:hourly].count).to eq(8)
    expect(@json[:location][:hourly][0]).to have_key :hour
    expect(@json[:location][:hourly][0]).to have_key :temp
    expect(@json[:location][:hourly][0]).to have_key :description
    expect(@json[:location][:hourly][0][:hour].class).to eq(String)
    expect(@json[:location][:hourly][0][:temp].class).to eq(Float)
    expect(@json[:location][:hourly][0][:description].class).to eq(String)
  end
end
