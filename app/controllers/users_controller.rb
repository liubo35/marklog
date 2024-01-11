class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies.signed[:marklog_session_id] = { value: @user.id, expires: 1.hour }
      redirect_to app_path, notice: "Signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
