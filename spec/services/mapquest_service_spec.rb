require 'rails_helper'

RSpec.describe "MapQuest Service" do
  it "can get routing directions from Turing to Fuel Station" do
    start_location = "1331 17th St LL100, Denver, CO 80202"
    final_location = "1225 17th Street, Suite 130, Denver, CO, 80202"

    route_data = MapquestService.route_directions(start_location, final_location)

    expect(route_data).to be_a(Hash)
    expect(route_data).to have_key(:route)
    expect(route_data[:route]).to be_a(Hash)
    expect(route_data[:route]).to have_key(:distance)
    expect(route_data[:route][:distance]).to be_a(Float)
    expect(route_data[:route]).to have_key(:formattedTime)
    expect(route_data[:route][:formattedTime]).to be_a(String)
    expect(route_data[:route]).to have_key(:legs)
    expect(route_data[:route][:legs]).to be_an(Array)

    route_maneuvers = route_data[:route][:legs].first
    expect(route_maneuvers).to have_key(:maneuvers)
    expect(route_maneuvers[:maneuvers]).to be_an(Array)

    route_directions = route_maneuvers[:maneuvers].first
    expect(route_directions).to have_key(:narrative)
    expect(route_directions[:narrative]).to be_a(String)
  end
end
