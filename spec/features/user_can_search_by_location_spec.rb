require 'rails_helper'

RSpec.describe 'Search by location' do
  it "can select Turing from start location drop down and go to search page" do
    visit '/'

    select "Turing", from: :location
    click_on "Find Nearest Station"

    expect(current_path).to eq("/search")
  end

  it "can see the closest electric fuel station to me and its attrs" do
    visit '/'

    select "Turing", from: :location
    click_on "Find Nearest Station"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Your Closest Electric Fuel Station:")
    expect(page).to have_content("Station Name")
    expect(page).to have_content("CBRE As Agent for EQC Operating Trust")
    expect(page).to have_content("Address")
    expect(page).to have_content("1225 17th Street, Suite 130, Denver, CO, 80202")
    expect(page).to have_content("Fuel Type")
    expect(page).to have_content("ELEC")
    expect(page).to have_content("Hours")
    expect(page).to have_content("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
#
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
#
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
