class ForecastFacade
  def self.forecast_by_coords(location)
    latlng = MapquestFacade.get_coords_by_location(location)
    forecast_data = ForecastService.forecast_by_coords(latlng[:lat], latlng[:lng])
  end
end
