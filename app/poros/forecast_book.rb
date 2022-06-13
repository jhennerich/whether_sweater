class ForecastBook
  attr_reader :current_weather,
              :book

  def initialize(current_weather, book)
    @current_weather = current_weather
    @book = book
  end
end
