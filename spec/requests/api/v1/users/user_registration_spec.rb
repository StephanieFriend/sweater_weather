require 'rails_helper'

RSpec.describe 'Registration', :vcr do
  it 'I can receive credentials and return user info' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.class).to eq(Hash)
    expect(response.status).to eq(201)
    expect(json[:data][:attributes]).to have_key :email
    expect(json[:data][:attributes]).to have_key :api_key
    expect(json[:data][:attributes][:email]).to eq('whatever@example.com')
  end

  it 'should error when not all fields are filled in' do
    post '/api/v1/users', params: {
        email: "",
        password: "password",
        password_confirmation: "password"
    }

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(json[:data][:attributes][:error_message]).to eq("Sorry man. Need that email and password")
  end

  it 'should error when email is already registered' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    expect(response.status).to eq(201)

    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
    }

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(json[:data][:attributes][:error_message]).to eq("Someone is already using your email?")
  end

  it 'should error when passwords doesnt match' do
    post '/api/v1/users', params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "pass"
    }

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(json[:data][:attributes][:error_message]).to eq("Passwords gotta match!")
  end
end
