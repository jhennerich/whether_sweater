require 'rails_helper'

describe OpenlibService do
  describe 'happy paths' do
    it 'can get the get data for a book by location name', :vcr do

      response = OpenlibService.get_book_info('denver,co')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_a(Integer)
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs][0]).to be_a(Hash)
      expect(response[:docs][0]).to have_key(:isbn)
      expect(response[:docs][0][:isbn]).to be_a(Array)
      expect(response[:docs][0]).to have_key(:title)
      expect(response[:docs][0][:title]).to be_a(String)
      expect(response[:docs][0]).to have_key(:publisher)
      expect(response[:docs][0][:publisher]).to be_a(Array)
      expect(response[:docs][0][:publisher][0]).to be_a(String)
    end
  end
end
