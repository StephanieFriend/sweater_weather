require 'rails_helper'

RSpec.describe 'Road Trip API' do
  before do
    VCR.configure do |c|
      @previous_allow_http_connections = c.allow_http_connections_when_no_cassette?
      c.allow_http_connections_when_no_cassette = true
    end
  end

  after do
    VCR.configure do |c|
      c.allow_http_connections_when_no_cassette = @previous_allow_http_connections
    end
  end

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

    expect(json[:data][:attributes]).to have_key :origin
    expect(json[:data][:attributes][:origin]).to eq("Denver,CO")

    expect(json[:data][:attributes]).to have_key :destination
    expect(json[:data][:attributes][:destination]).to eq("Pueblo,CO")
  end
end
