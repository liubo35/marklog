class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  def new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      cookies.signed[:marklog_session_id] = { value: user.id, expires: 1.hour }
      redirect_to app_path, notice: "Signed in successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    cookies.delete :marklog_session_id
    redirect_to root_path, notice: "Signed out successfully"
  end
end
