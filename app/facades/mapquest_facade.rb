class MapquestFacade
  def self.route_directions(start_location, final_location)
    data = MapquestService.route_directions(start_location, final_location)
    Route.new(data[:route][:legs].first)
  end
end
