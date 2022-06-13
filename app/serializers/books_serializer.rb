class BooksSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  attributes :current_weather, :total_books_found, :books
end
