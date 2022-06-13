require 'rails_helper'

describe 'OpenlibFacade' do
  it 'returns book_data for a location and quantity of books', :vcr do
    location = 'denver, co'
    quantity = '5'
    bookinfo = OpenlibFacade.get_book_info(location, quantity)

    expect(bookinfo.books.count).to eq(quantity.to_i)

    bookinfo.books.each do |book|
      expect(book).to be_a(Book)
    end

    expect(bookinfo.total_books_found).to be_a(Integer)
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
