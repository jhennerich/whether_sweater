class OpenlibFacade
  def self.get_book_info(location, quantity)
    book_data = OpenlibService.get_book_info(location)
    total_books_found = book_data[:numFound]

#    books = book_data[:docs][0..(quantity.to_i -1)].map do |data|
## running out of time to adjust
    books = book_data[:docs][0..quantity.to_i].map do |data|
      Book.new(data)
    end
#    return [books, total_books_found]
  end
end
