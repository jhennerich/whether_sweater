require 'rails_helper'

describe 'OpenlibFacade' do
  it 'returns book_data for a location', :vcr do

    bookinfo = OpenlibFacade.get_book_info('denver,co')
    binding.pry
#    expect(bookinfo).to be_a(Book)
#    expect(bookinfo.)
    ###
    # dup of OpenlibService spec
    # expect(response).to be_a(Hash)
    # expect(response).to have_key(:numFound)
    # expect(response[:numFound]).to be_a(Integer)
    # expect(response[:docs]).to be_a(Array)
    # expect(response[:docs][0]).to be_a(Hash)
    # expect(response[:docs][0]).to have_key(:isbn)
    # expect(response[:docs][0][:isbn]).to be_a(Array)
    # expect(response[:docs][0]).to have_key(:title)
    # expect(response[:docs][0][:title]).to be_a(String)
    # expect(response[:docs][0]).to have_key(:publisher)
    # expect(response[:docs][0][:publisher]).to be_a(Array)
    # expect(response[:docs][0][:publisher][0]).to be_a(String)



  end
end
