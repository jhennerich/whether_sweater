class OpenlibFacade
  def self.get_book_info(location, quantity)
    book_data = OpenlibService.get_book_info(location)
    total_books_found = book_data[:numFound]
    int_quantity = quantity.to_i - 1

#    books = book_data[:docs][0..(quantity.to_i -1)].map do |data|
## running out of time to adjust
    books = book_data[:docs][0..int_quantity].map do |data|
      Book.new(data)
    end

    forecast = ForecastFacade.forecast_by_coords(location)
    combine = ForecastBook.new(forecast.current_weather,total_books_found,books)
  end
end
