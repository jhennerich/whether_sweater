class OpenlibFacade
  def self.get_book_info(location, quantity)
    book_data = OpenlibService.get_book_info(location)

    book_data[0..quantity].map do |data|
      Book.new(data)
    end

  end
end
