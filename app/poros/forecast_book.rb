class ForecastBook
  attr_reader :current_weather,
              :total_books_found,
              :books

  def initialize(current_weather, total_books_found, books)
    @current_weather = current_weather
    @books = books
    @total_books_found = total_books_found
  end
end
