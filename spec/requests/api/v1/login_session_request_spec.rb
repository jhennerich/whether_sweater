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
  describe 'sad path' do
    it 'returns a 400 for incorrect password' do
      User.create!(email: 'john@email.com',
                   password: 'password',
                   password_confirmation: 'password',
                   api_key: SecureRandom.hex)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      body = {
        'email': 'john@email.com',
        'password': 'passwd'
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('could not authenticate credentials')
    end

    it 'returns 400 for incorrect email' do
      User.create!(email: 'john@email.com',
                   password: 'password',
                   password_confirmation: 'password',
                   api_key: SecureRandom.hex)

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      body = {
        'email': 'foo@email.com',
        'password': 'password'
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      expect(parsed).to have_key(:error)
      expect(parsed[:error]).to eq('could not authenticate credentials')
    end
  end
end
