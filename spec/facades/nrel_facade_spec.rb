require 'rails_helper'

RSpec.describe "NREL Facade" do
  it "returns electric fuel station object data" do
    start_location = "1331 17th St LL100, Denver, CO 80202"
    station = NrelFacade.nearest_station(start_location)

    expect(station).to be_a(Station)
    expect(station.name).to be_a(String)
    expect(station.address).to be_a(String)
    expect(station.fuel_type).to be_a(String)
    expect(station.access_times).to be_a(String)
  end
end
