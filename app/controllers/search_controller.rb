class SearchController < ApplicationController
  def index
    @station = NrelFacade.nearest_station(params[:location])
  end
end
