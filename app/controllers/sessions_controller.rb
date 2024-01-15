class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[ new create ]

  def new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      session[:user_id] = user.id

      redirect_to app_path, notice: "Signed in successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out successfully"
  end
end
