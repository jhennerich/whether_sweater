class Api::V1::BooksearchController < ApplicationController
#  before_action :check_params

  def index
    return if check_params

    forecast = ForecastFacade.forecast_by_coords(params[:location])
    books = OpenlibFacade.get_book_info(params[:location], params[:quantity])
    render json: BooksSerializer.new(forecast, books[0])
  end
end
