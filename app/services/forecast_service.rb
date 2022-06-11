class ForecastService
  def self.conn
    Faraday.new('https://api.openweathermap.org/data/2.5/onecall?',
      headers: { 'Content-type' => 'application/json'})
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.forecast_by_coords(lat, lng)
    response = conn.get('/data/2.5/onecall') do |required_params|
      required_params.params['lat'] = lat
      required_params.params['lon'] = lng
      required_params.params['exclude'] = 'minutely,alerts'
      required_params.params['units'] = 'imperial'
      required_params.params['appid'] = ENV['openweather_appid']
    end
    parse_json(response)
  end
end
