class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render :json => UserResponseSerializer.new(UserResponse.new(user.id, user.email, user.api_key, nil)),
             status: :ok
    else
      render :json => UserResponseSerializer.new(UserResponse.new(nil, nil, nil,
                                                                  "Username or Password is incorrect")),
             status: :bad_request
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
