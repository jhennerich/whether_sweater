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
        email: user.email.to_s,
        password: user.password.to_s,
        password_confirmation: user.password_confirmation.to_s
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
