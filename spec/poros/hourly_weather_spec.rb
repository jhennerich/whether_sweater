require 'rails_helper'

describe HourlyWeather do
  it 'can create hourly weather objects' do
    json_data = File.read('spec/fixtures/current_weather_denver.json')
    parsed_data = JSON.parse(json_data, symbolize_names: true)
    hourly = parsed_data[:hourly][0..7].first

    hourly_weather = HourlyWeather.new(hourly)
    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to be_a(String)
    expect(hourly_weather.temperature).to be_a(Numeric)
    expect(hourly_weather.conditions).to be_a(String)
    expect(hourly_weather.icon).to be_a(String)
  end
end
