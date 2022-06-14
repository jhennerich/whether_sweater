require 'rails_helper'

describe 'Sessions API endpoint' do
  describe 'happy path' do
    it 'finds user, confirms user and returns user info' do
      user = User.create!(email: 'john@email.com',
                          password: 'password',
                          password_confirmation: 'password',
                          api_key: SecureRandom.hex)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      body = {
        email: user.email,
        password: user.password,
        password_confirmation: user.password_confirmation
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_data = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_data).to be_a(Hash)
      expect(parsed_data).to have_key(:data)
      expect(parsed_data[:data]).to be_a(Hash)
      expect(parsed_data[:data]).to have_key(:id)
      expect(parsed_data[:data][:type]).to eq('users')
      expect(parsed_data[:data]).to have_key(:attributes)
      expect(parsed_data[:data][:id]).to be_a(String)
      expect(parsed_data[:data]).to have_key(:attributes)
      expect(parsed_data[:data][:attributes]).to have_key(:email)
      expect(parsed_data[:data][:attributes][:email]).to be_a(String)
      expect(parsed_data[:data][:attributes]).to have_key(:api_key)
      expect(parsed_data[:data][:attributes][:api_key]).to be_a(String)

    end
  end
end
