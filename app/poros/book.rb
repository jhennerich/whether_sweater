class Book
attr_reader :book
  def initialize(data)
    @book = book_hash(data)
  end
  def book_hash(data)
    {
      total_books_found: data[:numFound],
      title: data[:docs][:title],
      publisher: data[:docs][:publisher]

#      books: book_array(data)
    }
  end

  def book_array(data)
    [ ]
  end
end
