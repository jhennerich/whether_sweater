require 'rails_helper'

describe 'Forecast API' do
  describe 'Happy path' do

    it 'Finds and returns weather data for a city', :vcr do
      get '/api/v1/forecast?location=denver,co'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)
      expect(forecast).to be_a(Hash)

      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to be_nil
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq('forecast')
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to be_a(Hash)

      current_forecast = forecast[:data][:attributes][:current_weather]
      expect(current_forecast).to be_a(Hash)
      expect(current_forecast).to have_key(:datetime)
      expect(current_forecast[:datetime]).to be_a(String)
      expect(current_forecast).to have_key(:sunrise)
      expect(current_forecast[:sunrise]).to be_a(String)
      expect(current_forecast).to have_key(:sunset)
      expect(current_forecast[:sunset]).to be_a(String)
      expect(current_forecast).to have_key(:temperature)
      expect(current_forecast[:temperature]).to be_a(Numeric)
      expect(current_forecast).to have_key(:feels_like)
      expect(current_forecast[:feels_like]).to be_a(Numeric)
      expect(current_forecast).to have_key(:humidity)
      expect(current_forecast[:humidity]).to be_a(Numeric)
      expect(current_forecast).to have_key(:uvi)
      expect(current_forecast[:uvi]).to be_a(Numeric)
      expect(current_forecast).to have_key(:conditions)
      expect(current_forecast[:conditions]).to be_a(String)
      expect(current_forecast).to have_key(:icon)
      expect(current_forecast[:icon]).to be_a(String)

      expect(current_forecast).to_not have_key(:clouds)
      expect(current_forecast).to_not have_key(:pressure)

      daily_forecast = forecast[:data][:attributes][:daily_weather]
      expect(daily_forecast).to be_a(Array)
      expect(daily_forecast.count).to eq(5)
      expect(daily_forecast.first).to have_key(:date)
      expect(daily_forecast.first[:date]).to be_a(String)
      expect(daily_forecast.first).to have_key(:sunrise)
      expect(daily_forecast.first[:sunrise]).to be_a(String)
      expect(daily_forecast.first).to have_key(:sunset)
      expect(daily_forecast.first[:sunset]).to be_a(String)
      expect(daily_forecast.first).to have_key(:max_temp)
      expect(daily_forecast.first[:max_temp]).to be_a(Numeric)
      expect(daily_forecast.first).to have_key(:min_temp)
      expect(daily_forecast.first[:min_temp]).to be_a(Numeric)
      expect(daily_forecast.first).to have_key(:conditions)
      expect(daily_forecast.first[:conditions]).to be_a(String)
      expect(daily_forecast.first).to have_key(:icon)
      expect(daily_forecast.first[:icon]).to be_a(String)

      expect(current_forecast).to_not have_key(:clouds)
      expect(current_forecast).to_not have_key(:pressure)

      hourly_forecast = forecast[:data][:attributes][:hourly_weather]
      expect(hourly_forecast).to be_a(Array)
      expect(hourly_forecast.count).to eq(8)
      expect(hourly_forecast.first).to have_key(:time)
      expect(hourly_forecast.first[:time]).to be_a(String)
      expect(hourly_forecast.first).to have_key(:temperature)
      expect(hourly_forecast.first[:temperature]).to be_a(Numeric)
      expect(hourly_forecast.first).to_not have_key(:wind_speed)
      expect(hourly_forecast.first).to_not have_key(:wind_direction)

      expect(hourly_forecast.first).to have_key(:conditions)
      expect(hourly_forecast.first[:conditions]).to be_a(String)
      expect(hourly_forecast.first).to have_key(:icon)
      expect(hourly_forecast.first[:icon]).to be_a(String)

      expect(current_forecast).to_not have_key(:clouds)
      expect(current_forecast).to_not have_key(:pressure)
    end
  end
  describe 'Sad path no params' do
    it "can't get a forcast without params", :vcr do
      get '/api/v1/forecast'
      expect(response.status).to eq(400)
    end
  end
end
