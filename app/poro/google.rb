class Google
  attr_reader :city, :state, :lat, :lng

  def initialize(location_info)
    @city = location_info[:results][0][:address_components][0][:long_name]
    @state = location_info[:results][0][:address_components][2][:short_name]
    @lat = location_info[:results][0][:geometry][:location][:lat]
    @lng = location_info[:results][0][:geometry][:location][:lng]
  end
end