require 'rails_helper'

describe 'Road Trip API endpoint' do
  describe 'happy path' do
    it 'returns road trip info in JSON format', :vcr do
      origin = 'Denver, CO'
#      origin = 'New York City, NY'
      destination = 'Pueblo, CO'
#      destination = 'San Fransico, CA'
      api_key = SecureRandom.hex

      User.create!(email: 'john@email.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: api_key)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      request_body = {
        "origin": origin,
        "destination": destination,
        "api_key": api_key
      }

      post '/api/v1/road_trip', headers: headers, params: JSON.generate(request_body)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      roadtrip = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
