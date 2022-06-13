require 'rails_helper'

describe 'Book-Search API' do
  describe 'Happy path' do

    it 'Finds and returns book data for a city', :vcr do
      get '/api/v1/book-search?location=denver,co&quantity=5'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      result = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(result).to be_a(Hash)
    end
  end
end
