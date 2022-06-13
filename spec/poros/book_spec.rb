require 'rails_helper'

describe Book do
  it 'can create a book object' do
    data = {
            :title=>"Denver, Co",
            :isbn=>["9780762507849", "0762507845"],
            :publisher=>["Universal Map Enterprises"]
    }

    book = Book.new(data)

    expect(book).to be_a(Book)
    expect(book.isbn).to be_a(Array)
    expect(book.isbn.first).to be_a(String)
    expect(book.title).to be_a(String)
    expect(book.publisher).to be_a(Array)
    expect(book.publisher.first).to be_a(String)


  end
end
