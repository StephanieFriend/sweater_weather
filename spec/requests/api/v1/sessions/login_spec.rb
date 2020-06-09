require 'rails_helper'

RSpec.describe 'Session Login', :vcr do
  it 'Can input proper credentials and return login info' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response).to be_successful

    post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password"
    }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    data = json[:data][:attributes]

    expect(json.class).to eq(Hash)
    expect(data).to have_key :email
    expect(data[:email]).to eq("whatever@example.com")
    expect(data).to have_key :api_key
    expect(data[:api_key].class).to eq(String)
  end

  it 'Can input improper credentials and return error' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response).to be_successful

    post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "pass"
    }

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(json[:data][:attributes]).to have_key :error_message
    expect(json[:data][:attributes][:error_message]).to eq("Username or Password is incorrect")
  end
end