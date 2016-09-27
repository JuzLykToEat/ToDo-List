class API::V1::SessionsController < API::V1::BaseController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: login_params[:email])

    if user.valid_password?(login_params[:password])
      render json: payload(user)
    else
      render json: {errors: ["Error with your login or password"]}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: AuthTokenService.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
