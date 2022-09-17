require 'rails_helper'

RSpec.describe Route do
  it "exists" do
    response = File.read('spec/fixtures/route_test_data.json')
    route_data = JSON.parse(response, symbolize_names: true)
    route = Route.new(route_data[:route][:legs].first)
    
    expect(route.distance).to eq(0.081)
    expect(route.travel_time).to eq("00:00:18")
    expect(route.directions).to eq("Start out going southeast on 17th St toward Larimer St/CO-33., 1225 17TH ST, SUITE 130 is on the right.")
  end
end
