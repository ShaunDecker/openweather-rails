require 'faraday'
require 'json'

class Connection
  BASE = 'https://api.openweathermap.org/data/2.5/weather'

  def self.api(query)
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.params['units'] = 'imperial'
      faraday.params['q'] = query
      faraday.params['appid'] = ENV['WEATHER_API_KEY']
      faraday.headers['Content-Type'] = 'application/json'
    end
  end
end