class MapquestService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
    faraday.params['key'] = ENV['mapquest_api_key']
  end

  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_coords_by_location(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
      parse_json(response)[:results][0][:locations][0][:latLng]
  end

  def self.travel_time(from, to)
    response = conn.get('/directions/v2/route') do |required_params|
      required_params.params['from'] = from
      required_params.params['to'] = to
    end
    parse_json(response)[:route][:formattedTime]
  end
end
