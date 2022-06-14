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
      expect(response).to be_a(String)
    end
  end
end
