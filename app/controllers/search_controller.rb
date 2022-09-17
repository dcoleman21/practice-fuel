class SearchController < ApplicationController
  def index
    @station = NrelFacade.nearest_station(params[:location])
    @route = MapquestFacade.route_directions(params[:location], @station.address)
  end
end
