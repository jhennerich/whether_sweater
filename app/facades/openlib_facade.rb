class OpenlibFacade
  def self.get_book_info(location)
    book_data = OpenlibService.get_book_info(location)
  end
end
