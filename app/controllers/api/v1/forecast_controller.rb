class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.forecast_by_coords(params[:location])
  end
end
