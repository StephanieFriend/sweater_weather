class Distance

  def initialize(travel_location)
    @end_location = travel_location[:routes][0][:legs][0][:end_address]
    @distance = travel_location[:routes][0][:legs][0][:duration][:text]
  end
end