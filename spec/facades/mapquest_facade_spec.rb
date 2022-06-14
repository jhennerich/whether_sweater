require 'rails_helper'

describe 'Mapquest Facade' do
  it 'returns the lat and lon for a city', :vcr do

    location = MapquestFacade.get_coords_by_location('denver,co')

    expect(location).to be_a(Hash)

    expect(location).to have_key(:lat)
    expect(location[:lat]).to be_a(Float)
    expect(location).to have_key(:lng)
    expect(location[:lng]).to be_a(Float)
  end

  it 'returns the time in seconds to travel from origin to destination', :vcr do

    time_in_seconds = MapquestFacade.travel_time('Denver, CO', 'St. Louis, MO')
    expect(time_in_seconds).to be_a(Integer)
  end

  it 'Sad path: no route between locations', :vcr do

    time_in_seconds = MapquestFacade.travel_time('Denver, CO', 'Honolulu, HI')
    expect(time_in_seconds).to eq('impossible route')
  end
end
