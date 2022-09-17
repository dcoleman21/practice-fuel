class NrelService
  def self.nearest_station(start_location)
    response = conn.get("api/alt-fuel-stations/v1/nearest.json?location=#{start_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://developer.nrel.gov') do |f|
      f.params['api_key'] = ENV['NREL_API_KEY']
      f.params['limit'] = 1
      f.params['fuel_type'] = 'ELEC'
      f.params['access'] = 'public'
    end
  end
end
