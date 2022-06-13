class Book
  attr_reader :books

  def initialize(data)
    @books = book_hash(data)
  end

  def book_hash(data)
    {
      isbn: data[:isbn],
      title: data[:title],
      publisher: data[:publisher]
    }
  end
end
