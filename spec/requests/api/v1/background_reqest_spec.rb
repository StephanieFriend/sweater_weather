require 'rails_helper'

RSpec.describe 'Photo API', :vcr do
  it 'can call out and receive photo' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json.class).to eq(Hash)
    expect(json[:location]).to have_key :photo
  end
end