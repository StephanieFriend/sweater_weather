class UserResponse
  attr_accessor :email, :api_key, :error_message, :id

  def initialize(id, email, api_key, error_message)
    @email = email
    @error_message = error_message
    @api_key = api_key
    @id = id
  end

end