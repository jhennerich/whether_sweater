require 'rails_helper'

describe 'Forecast API' do
  it 'Finds and returns weather for a city', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
