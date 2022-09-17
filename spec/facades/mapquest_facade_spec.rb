require 'rails_helper'

RSpec.describe "MapQuest Facade" do
  it "can create route objects" do
    start_location = "1331 17th St LL100, Denver, CO 80202"
    final_location = "1225 17th Street, Suite 130, Denver, CO, 80202"
    route = MapquestFacade.route_directions(start_location, final_location)
    
    expect(route).to be_a(Route)
    expect(route.directions).to be_a(String)
    expect(route.distance).to be_a(Float)
    expect(route.travel_time).to be_a(String)
  end
end
