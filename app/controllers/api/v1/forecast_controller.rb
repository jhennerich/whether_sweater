class Api::V1::ForecastController < ApplicationController
  before_action :check_params

  def index
    return if check_params
    forecast = ForecastFacade.forecast_by_coords(params[:location])
    render json: ForecastSerializer.new(forecast)
  end
end
