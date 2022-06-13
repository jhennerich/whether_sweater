class ForecastBook
  attr_reader :current_weather,
              :total_books_found,
              :book

  def initialize(current_weather, book, total_books_found)
    @current_weather = current_weather
    @book = book
    @total_books_found = total_books_found
  end
end
