class OpenlibFacade
  def self.get_book_info(location, quantity)
    book_data = OpenlibService.get_book_info(location)
    total_books_found = book_data[:numFound]

    book_data[:docs][0..quantity].map do |data|

      Book.new(data)
    end

  end
end