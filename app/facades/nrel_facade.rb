class NrelFacade
  def self.nearest_station(start_location)
    station = NrelService.nearest_station(start_location)
    Station.new(station[:fuel_stations].first)
  end
end
