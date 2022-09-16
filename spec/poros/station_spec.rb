require 'rails_helper'

RSpec.describe Station do
  it "exists" do
    response = File.read('spec/fixtures/station_test_data.json')
    station_data = JSON.parse(response, symbolize_names: true)
    station = Station.new(station_data[:fuel_stations].first)

    expect(station.name).to eq("CBRE As Agent for EQC Operating Trust")
    expect(station.address).to eq("1225 17th Street, Suite 130, Denver, CO, 80202")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end
