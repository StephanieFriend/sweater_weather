require 'rails_helper'

RSpec.describe 'Geolocator Service', :vcr do
  it 'can receive city and state and return coords' do
    google = GoogleServices.get_json("Denver, CO")

    expect(google.class).to eq(Hash)
    expect(google[:results][0][:geometry][:location][:lat]).to eq(39.7392358)
    expect(google[:results][0][:geometry][:location][:lng]).to eq(-104.990251)
  end
end
