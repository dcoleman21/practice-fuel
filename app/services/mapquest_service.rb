class MapquestService

  def self.route_directions(start_location, final_location)
    response = conn.get("/directions/v2/route?from=#{start_location}&to=#{final_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['MAP_API_KEY']
    end
  end
end
