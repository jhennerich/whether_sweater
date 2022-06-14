class RoadTrip
  attr_reader :start_city,
              :end_city,
              :road_trip_time,
              :weather_at_eta

  def initialize(origin, destination, road_trip_time, weather_data)
    @start_city = origin
    @end_city = destination
    @road_trip_time = road_trip_time
    unless road_trip_time == 'impossible route'
      @time_in_seconds = road_trip_time
      @road_trip_time = ActiveSupport::Duration.build(road_trip_time).inspect
      @weather_at_eta = weather_at_destination(weather_data)
    end
  end

  def weather_at_destination(weather_data)
    #split seconds into hash of {:days=>1, :hours=>17, :minutes=>25, :seconds=>54}
    find_day = ActiveSupport::Duration.build(@time_in_seconds).parts
    day_to_use = find_day[:days]
    {
      temperature: weather_data[:daily][day_to_use][:temp][:day],
      conditions: weather_data[:daily][day_to_use][:weather][0][:description]
    }
  end
end
