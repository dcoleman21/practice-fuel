class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_times

  def initialize(data)
    @name = data[:station_name]
    @address = full_address(data)
    @fuel_type = data[:fuel_type_code]
    @access_times = data[:access_days_time]
  end

  def full_address(data)
    array = data[:street_address], data[:city], data[:state], data[:zip]
    array.join(", ")
  end
end
