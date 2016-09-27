class API::V1::RegistrationsController < API::V1::BaseController
  respond_to :json
  def create

    @user = User.new(user_params)
    if @user.save
      render json: @user, :status=>200
      return
    else
      warden.custom_failure!
      render :json=> @user.errors, :status=>422
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
