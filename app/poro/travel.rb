class Travel
  attr_reader :id

  def initialize(start, ending)
    @id = "#{start}" + "#{ending}"
  end

  def travel_info
    {
        :travel_time =>  "21 min "
    }
  end
end