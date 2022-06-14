require 'rails_helper'

describe 'RoadTrip poro' do
  it 'can create road trip objects' do
    origin = 'Denver, CO'
    destination = 'St. Louis, MO'
    api_key = SecureRandom.hex

    User.create!(email: 'john@email.com',
                 password: 'password',
                 password_confirmation: 'password',
                 api_key: api_key)

    road_trip_time = 43643

    raw_data = File.read('spec/fixtures/current_weather_denver.json')
    parsed_data = JSON.parse(raw_data, symbolize_names: true)
    road_trip = RoadTrip.new(origin, destination, road_trip_time, parsed_data)

    expect(road_trip).to be_a(RoadTrip)
    expect(road_trip.start_city).to be_a(String)
    expect(road_trip.start_city).to eq('Denver, CO')
    expect(road_trip.end_city).to be_a(String)
    expect(road_trip.end_city).to eq('St. Louis, MO')
    expect(road_trip.road_trip_time).to be_a(String)
    expect(road_trip.weather_at_eta).to be_a(Hash)
    expect(road_trip.weather_at_eta[:temperature]).to be_a(Numeric)
    expect(road_trip.weather_at_eta[:conditions]).to be_a(String)
  end
end
