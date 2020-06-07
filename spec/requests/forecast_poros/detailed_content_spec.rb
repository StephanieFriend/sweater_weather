require 'rspec-rails'

RSpec.describe 'Location API' do
  it 'can return detailed content' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    @json = JSON.parse(response.body, symbolize_names: true)

    expect(@json.class).to eq(Hash)
    expect(@json[:location][:details][0]).to have_key :description
    expect(@json[:location][:details][0]).to have_key :sunrise
    expect(@json[:location][:details][0]).to have_key :sunset
    expect(@json[:location][:details][0]).to have_key :feels_like
    expect(@json[:location][:details][0]).to have_key :humidity
    expect(@json[:location][:details][0]).to have_key :visibility
    expect(@json[:location][:details][0]).to have_key :uv_index
    expect(@json[:location][:details][0][:description].class).to eq(String)
    expect(@json[:location][:details][0][:sunrise].class).to eq(String)
    expect(@json[:location][:details][0][:sunset].class).to eq(String)
    expect(@json[:location][:details][0][:feels_like].class).to eq(Float)
    expect(@json[:location][:details][0][:humidity].class).to eq(Integer)
    expect(@json[:location][:details][0][:uv_index].class).to eq(Float)
  end
end
