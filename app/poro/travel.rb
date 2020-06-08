class Travel
  attr_reader :id

  def initialize(start, ending)
    @id = nil
    @start = start
    @ending = ending
    @direction = DirectionServices.get_json(@start, @ending)
    binding.pry
  end

  def travel_info
    {
        :end_location => @ending,
        :travel_time =>  Distance.new(@direction)
    }
  end
end