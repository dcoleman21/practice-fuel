require 'rails_helper'

RSpec.describe "NREL Service" do
  it "can return the nearest electric fuel stations attributes" do
    start_location = "1331 17th St LL100, Denver, CO 80202"
    station_data = NrelService.nearest_station(start_location)

    expect(station_data).to be_a(Hash)
    expect(station_data).to have_key(:fuel_stations)
    expect(station_data[:fuel_stations]).to be_an(Array)

    first_station = station_data[:fuel_stations].first

    expect(first_station).to have_key(:station_name)
    expect(first_station[:station_name]).to be_a(String)
    expect(first_station).to have_key(:street_address)
    expect(first_station[:street_address]).to be_a(String)
    expect(first_station).to have_key(:fuel_type_code)
    expect(first_station[:fuel_type_code]).to be_a(String)
    expect(first_station).to have_key(:access_days_time)
    expect(first_station[:access_days_time]).to be_a(String)
  end
end
