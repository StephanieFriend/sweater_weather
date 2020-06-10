require 'rails_helper'

RSpec.describe 'Directions API', :vcr do
  it 'Can return travel time based on two endpoints' do
    direction = DirectionServices.get_json("Denver, CO", "Pueblo, CO")

    expect(direction.class).to eq(Hash)
    expect(direction[:routes][0][:legs][0][:duration][:text]).to eq("1 hour 48 mins")
  end
end