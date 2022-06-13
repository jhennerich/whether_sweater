require 'rails_helper'

describe OpenlibService do
  describe 'happy paths' do
    it 'can get the get data for a book by location name', :vcr do

      response = OpenlibService.get_book_info('denver,co')
      expect(response).to be_a(Hash)
      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_a(Interger)
      expect(response[:docs]).to be_an[Array]

    end
  end
end
