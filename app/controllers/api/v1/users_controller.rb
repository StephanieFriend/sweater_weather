class Api::V1::UsersController < ApplicationController

  def create
    user1 = User.new(user_params)
    user1.update(api_key: SecureRandom.hex)
    if !user1.save
      render :json => UserSerializer.new(user1), status: :bad_request
    else
      render :json => UserSerializer.new(user1), status: :created
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
