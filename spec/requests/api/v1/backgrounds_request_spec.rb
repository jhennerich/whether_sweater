require 'rails_helper'

describe 'backgrounds API endpoint' do
  it 'can get a background image for a given city and kind of weather', :vcr do

    get '/api/v1/backgrounds?location=denver,co'
  end
end
