class ForecastFacade
  def self.forecast_by_coords(location)
    latlng = MapquestFacade.get_coords_by_location(location)
    forecast_data = ForecastService.forecast_by_coords(latlng[:lat], latlng[:lng])
    current = CurrentWeather.new(forecast_data[:current])
    daily = forecast_data[:daily][0..4].map do |data|
      DailyWeather.new(data)
    end
    hourly = forecast_data[:hourly].map do |data|
      HourlyWeather.new(data)
    end
    Forecast.new(current, daily, hourly)
  end
end
