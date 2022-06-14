require 'rails_helper'

describe 'Users API endpoint' do
  describe 'happy paths' do
    it 'can sign up a new user' do
      body = {
        'email': 'john@email.com',
        'password': 'password',
        'password_confirmation': 'password'
      }

      post '/api/v1/users', params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_data = JSON.parse(response.body, symbolize_names: true)
      

    end
  end
end
