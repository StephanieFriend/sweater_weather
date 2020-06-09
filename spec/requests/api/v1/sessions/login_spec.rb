require 'rails_helper'

RSpec.describe 'Session Login' do
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

  it 'Can input proper credentials and return login info' do
    post '/api/v1/sessions', params: {
        email: "whatever@example.com",
        password: "password"
    }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    binding.pry
  end
end