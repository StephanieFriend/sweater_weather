class Food

  def initialize(food_info)
    @name = food_info[:restaurants][0][:restaurant][:name]
    @address = food_info[:restaurants][0][:restaurant][:location][:address]
    @city = food_info[:restaurants][0][:restaurant][:location][:city]
    @zip = food_info[:restaurants][0][:restaurant][:location][:zipcode]
  end

  def address_formatting
    {
        :name => @name,
        :address => "#{@address}" + ", " + "#{@city} #{@zip}"
    }
  end
end
