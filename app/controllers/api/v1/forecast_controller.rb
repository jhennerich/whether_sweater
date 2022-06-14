class Api::V1::ForecastController < ApplicationController
  before_action :check_params

  def index
    return if check_params
    forecast = ForecastFacade.forecast_by_coords(params[:location])
    render json: ForecastSerializer.new(forecast)
  end

  private
    def check_params
      render json: { 'error': 'Missing or Incorrect query' }, status: 400 if !params[:location] || params[:location] == ''
    end
end
