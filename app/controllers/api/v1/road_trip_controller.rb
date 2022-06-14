class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    if user.nil?
      render json: { error: 'Unable To Authenticate' }, status: 401
    else
      road_trip = RoadTripFacade.travel_time(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    end
  end
end
