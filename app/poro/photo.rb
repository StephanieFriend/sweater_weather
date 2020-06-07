class Photo

  def self.return_image(location)
    photo = PhotoServices.get_json(location)

  end
end