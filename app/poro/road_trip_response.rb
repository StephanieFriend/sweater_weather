class RoadTripResponse
  attr_reader :id, :origin, :destination, :error_message

  def initialize(id, origin, destination, error_message)
    @id = id
    @origin = origin
    @destination = destination
    @error_message = error_message
  end
end
