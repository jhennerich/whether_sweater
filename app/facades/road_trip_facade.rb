class RoadTripFacade
  def self.travel_time(origin, destination)
    road_trip_time = MapquestFacade.travel_time(origin, destination)
    weather_data = nil

    if road_trip_time != 'impossible route'
      coords = MapquestFacade.get_coords_by_location(destination)
      weather_data = ForecastService.forecast_by_coords(coords[:lat], coords[:lng])
    end

    RoadTrip.new(origin, destination, road_trip_time, weather_data)
  end
end
