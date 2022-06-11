class MapquestFacade
  def self.get_coords_by_location(location)
    MapquestService.get_coords_by_location(location)
  end
end
