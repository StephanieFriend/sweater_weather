class Photo

  def self.return_image(location)
    photo = PhotoServices.get_json(location)
    {
        :photo => photo[:results][0][:urls][:regular]
    }
  end
end