require 'rails_helper'

RSpec.describe 'Road Trip API', :vcr do
  it 'Can receive proper credentials and return trip info' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password"
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    login_json = JSON.parse(response.body, symbolize_names: true)
    key = login_json[:data][:attributes][:api_key]

    post '/api/v1/road_trip', params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: key
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes][:road_trip]).to have_key :origin
    expect(json[:data][:attributes][:road_trip][:origin]).to eq("Denver,CO")

    expect(json[:data][:attributes][:road_trip]).to have_key :destination
    expect(json[:data][:attributes][:road_trip][:destination]).to eq("Pueblo,CO")
  end

  it 'Can receive improper credentials and return error message' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password"
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    login_json = JSON.parse(response.body, symbolize_names: true)
    key = login_json[:data][:attributes][:api_key]

    post '/api/v1/road_trip', params: {
        origin: "Denver,CO",
        destination: "Pueblo,CO",
        api_key: key + "1"
    }

    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:attributes]).to have_key :error_message
    expect(json[:data][:attributes][:error_message]).to eq("Must use a valid API key for request")
  end
end
