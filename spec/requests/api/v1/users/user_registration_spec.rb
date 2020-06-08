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
    expect(json[:data][:attributes]).to have_key :email
    expect(json[:data][:attributes]).to have_key :api_key
    expect(json[:data][:attributes][:email]).to eq('whatever@example.com')
  end
end