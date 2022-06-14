require 'rails_helper'

describe MapquestService do
  describe 'happy paths' do
    it 'can get the get the lat and lon for a location', :vcr do

      response = MapquestService.get_coords_by_location('denver,co')
      expect(response).to be_a(Hash)
      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Float)
      expect(response).to have_key(:lng)
      expect(response[:lng]).to be_a(Float)
    end

    it 'can get the time to drive between two places', :vcr do
      response = MapquestService.travel_time('Denver, CO', 'Pueblo, CO')
#      response = MapquestService.travel_time('Denver, CO', 'HI')
      expect(response).to be_a(Hash)
      expect(response).to have_key(:info)
      expect(response[:info]).to have_key(:statuscode)
      expect(response[:info][:statuscode]).to eq(0)
      expect(response).to have_key(:route)
      expect(response[:route]).to have_key(:formattedTime)
      expect(response[:route][:formattedTime]).to be_a(String)
    end
  end
end
