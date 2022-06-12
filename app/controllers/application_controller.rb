class ApplicationController < ActionController::API
  def check_params
     render json: { 'message': 'Missing or Incorrect query' }, status: 400 if !params[:location] || params[:location] == ''
  end
end
