class Book
  attr_reader :book

  def initialize(data)
    @book = book_hash(data)
  end

  def book_hash(data)
    {
      isbn: data[:isbn],
      title: data[:title],
      publisher: data[:publisher]
    }
  end
end
