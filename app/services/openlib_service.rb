class OpenlibService
  def self.conn
    Faraday.new(url: 'http://openlibrary.org/')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_book_info(location)
      response = conn.get("/search.json?q=#{location}")
      parse_json(response)
  end
end
