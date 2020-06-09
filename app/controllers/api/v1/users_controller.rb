class Api::V1::UsersController < ApplicationController

  def create
    user1 = User.new(user_params)
    error_message = user1.validate
    status = user1.update(api_key: SecureRandom.hex) ? :created : :bad_request
    render :json => UserResponseSerializer.new(UserResponse.new(user1.id, user1.email, user1.api_key, error_message)),
           status: status
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
