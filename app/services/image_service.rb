class ImageService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com', headers: { 'Content-type' => 'application/json' })
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_image_info(location)
    response = conn.get('/search/photos') do |required_params|
      required_params.params['query'] = location
      required_params.params['page'] = 1
      required_params.params['per_page'] = 1
      required_params.params['client_id'] = ENV['unsplash_api_key']
    end
    parse_json(response)
  end
end
