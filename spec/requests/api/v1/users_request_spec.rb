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
#      {:data=>{:id=>"4", :type=>"users", :attributes=>{:email=>"john@email.com", :api_key=>""}}}

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

  describe 'sad paths' do
    it 'has missing fields' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      body = {
        'email': '',
        'password': '',
        'password_confirmation': ''
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq("Password can't be blank, Password can't be blank, Email can't be blank, and Password confirmation can't be blank")
    end

    it 'email must be unique' do
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
        'password': 'password',
        'password_confirmation': 'password'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq('Email has already been taken')
    end

    it 'passwords do not match' do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      body = {
        'email': 'john@email.com',
        'password': 'password',
        'password_confirmation': 'passwd'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq("Password confirmation doesn't match Password")
    end

    it 'email must be unique and passwords do not match' do
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
        'password': 'password',
        'password_confirmation': 'passwd'
      }

      post '/api/v1/users', headers: headers, params: JSON.generate(body)

      expect(response.status).to eq(401)
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed[:errors]).to eq("Password confirmation doesn't match Password and Email has already been taken")
    end
  end
end
