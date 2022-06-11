class Api::V1::ForecastController < ApplicationController
  def index
    MapquestService.get_coords_by_location(params[:location])
  end
end
