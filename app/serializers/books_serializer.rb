class BooksSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
#  attributes :current_weather, :book
  attributes :current_weather, :book
end
