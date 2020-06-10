class Distance

  def initialize(travel_location)
    @distance = travel_location[:routes][0][:legs][0][:duration][:text]
  end
end