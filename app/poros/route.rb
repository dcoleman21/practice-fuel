class Route
  attr_reader :distance,
              :travel_time,
              :directions
              
  def initialize(data)
    @distance = data[:distance]
    @travel_time = data[:formattedTime]
    @directions = direction_instructions(data)
  end

  def direction_instructions(data)
    route = data[:maneuvers].map do |direction|
      direction[:narrative]
    end
    route.join(", ")
  end
end
