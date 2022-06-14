require 'rails_helper'

describe 'Users API endpoint' do
  describe 'happy paths' do
    it 'can sign up a new user' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
      body = {
        'email': 'john@email.com',
        'password': 'password',
        'password_confirmation': 'password'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_data = JSON.parse(response.body, symbolize_names: true)
#      {:data=>{:id=>"4", :type=>"users", :attributes=>{:email=>"john@email.com", :api_key=>"2a3c71d211a0ca2368fddf0cc24ff332"}}}

      expect(parsed_data).to be_a(Hash)
      expect(parsed_data).to have_key(:data)
      expect(parsed_data[:data]).to be_a(Hash)
      expect(parsed_data[:data]).to have_key(:type)
      expect(parsed_data[:data][:type]).to eq('users')
      expect(parsed_data[:data]).to have_key(:id)
      expect(parsed_data[:data][:id]).to be_a(String)
      expect(parsed_data[:data]).to have_key(:attributes)
      expect(parsed_data[:data][:attributes]).to have_key(:email)
      expect(parsed_data[:data][:attributes][:email]).to be_a(String)
      expect(parsed_data[:data][:attributes]).to have_key(:api_key)
      expect(parsed_data[:data][:attributes][:api_key]).to be_a(String)

      created_user = User.last
      expect(created_user.email).to eq(body[:email])
    end
  end
end
