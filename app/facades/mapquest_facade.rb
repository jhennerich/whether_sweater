class MapquestFacade
  def self.get_coords_by_location(location)
    MapquestService.get_coords_by_location(location)
  end

  def self.travel_time(origin, destination)
    results = MapquestService.travel_time(origin, destination)
    if results[:info][:statuscode] == 402
      'impossible route'
    else
      results[:route][:time]
    end
  end
end
