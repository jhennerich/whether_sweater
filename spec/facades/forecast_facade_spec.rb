require 'rails_helper'

describe 'Forecast Facade' do
  it 'returns the forecast for a city', :vcr do
    forecast = ForecastFacade.forecast_by_coords('denver,co')
    expect(forecast).to be_a(Array)
    expect(forecast[0]).to be_a(CurrentWeather)
    expect(forecast[1]).to be_an(Array)
    forecast[1].each do |daily|
      expect(daily).to be_a(DailyWeather)
    end

    expect(forecast[2]).to be_an(Array)
    forecast[2].each do |hourly|
      expect(hourly).to be_a(HourlyWeather)
    end
  end
end
