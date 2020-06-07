require 'rails_helper'

RSpec.describe 'Location API', :vcr do
  it 'can call out and retrieve all needed info' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:location].class).to eq(Hash)
    expect(json[:location]).to have_key :main
    expect(json[:location]).to have_key :details
    expect(json[:location]).to have_key :hourly
    expect(json[:location]).to have_key :daily
    expect(json[:location][:main].count).to eq(1)
    expect(json[:location][:details].count).to eq(1)
    expect(json[:location][:hourly].count).to eq(8)
    expect(json[:location][:daily].count).to eq(5)
  end
end
