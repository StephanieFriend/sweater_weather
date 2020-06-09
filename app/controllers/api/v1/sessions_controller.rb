class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render :json => UserSerializer.new(user), status: :ok
    else
      render :json => User.login_error, status: :bad_request
    end
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
