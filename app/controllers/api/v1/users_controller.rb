class Api::V1::UsersController < ApplicationController

  def create
    user1 = User.new(user_params)
    user1.update(api_key: SecureRandom.hex)
    user1.save
    render :json => UserSerializer.new(user1)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
