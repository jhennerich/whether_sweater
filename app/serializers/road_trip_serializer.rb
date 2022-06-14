class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type 'roadtrip'
  attributes :start_city, :end_city, :road_trip_time, :weather_at_eta
end
