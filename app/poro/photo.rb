class Photo
  attr_reader :id

  def initialize(location)
    @photo = PhotoServices.get_json(location)
    @id = location
  end

  def return_image
    {
        :photo => @photo[:results][0][:urls][:regular]
    }
  end
end
