class ForecastService
  def self.conn
    Faraday.new('https://api.openweathermap.org/data/2.5/onecall?',
      headers: { 'Content-type' => 'application/json'})
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

#  def self.
#    faraday.params['appid'] = ENV['openweather_appid']
#  end
end
