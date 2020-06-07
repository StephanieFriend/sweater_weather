require 'rails_helper'

RSpec.describe 'Location API', :vcr do
  it 'can return main content' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    @json = JSON.parse(response.body, symbolize_names: true)

    expect(@json.class).to eq(Hash)
    expect(@json[:location][:main][0]).to have_key :current_temp
    expect(@json[:location][:main][0]).to have_key :high_temp
    expect(@json[:location][:main][0]).to have_key :low_temp
    expect(@json[:location][:main][0]).to have_key :current_description
    expect(@json[:location][:main][0]).to have_key :date_time
    expect(@json[:location][:main][0][:current_temp].class).to eq(Float)
    expect(@json[:location][:main][0][:high_temp].class).to eq(Float)
    expect(@json[:location][:main][0][:low_temp].class).to eq(Float)
    expect(@json[:location][:main][0][:current_description].class).to eq(String)
    expect(@json[:location][:main][0][:date_time].class).to eq(String)
  end
end
