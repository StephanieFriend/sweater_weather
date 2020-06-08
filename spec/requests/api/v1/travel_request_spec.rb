require 'rails_helper'

RSpec.describe 'Foodie API', :vcr do
  it 'I enter a city and receive travel info' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    foodie = json[:data][:attributes][:foodie]

    expect(json.class).to eq(Hash)
    expect(foodie[:travel_time]).to have_key :end_location
    expect(foodie[:travel_time][:end_location]).to eq("Pueblo, CO, USA")

    expect(foodie).to have_key :travel_time
    expect(foodie[:travel_time]).to have_key :distance
    expect(foodie[:travel_time][:distance]).to eq("1 hour 48 mins")

    expect(foodie).to have_key :forecast
    expect(foodie[:forecast]).to have_key :summary
    expect(foodie[:forecast]).to have_key :temperature
    expect(foodie[:forecast][:summary].class).to eq(String)
    expect(foodie[:forecast][:temperature].class).to eq(Float)

    expect(foodie).to have_key :restaurant
    expect(foodie[:restaurant]).to have_key :name
    expect(foodie[:restaurant]).to have_key :address
    expect(foodie[:restaurant]).to have_key :city
    expect(foodie[:restaurant]).to have_key :zip
    expect(foodie[:restaurant][:name].class).to eq(String)
    expect(foodie[:restaurant][:address].class).to eq(String)
    expect(foodie[:restaurant][:city].class).to eq(String)
    expect(foodie[:restaurant][:zip].class).to eq(String)
  end
end
