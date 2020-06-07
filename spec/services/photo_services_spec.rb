require 'rails_helper'

RSpec.describe 'Photo API', :vcr do
  it 'can input a param and will return a photo' do
    photo = PhotoServices.get_json('Denver, CO')

    expect(photo.class).to eq(Hash)
    expect(photo[:results][0][:urls][:regular].class).to eq(String)
  end
end
