class HomeController < ApplicationController
  skip_before_action :authenticate

  def index
    redirect_to app_path if session[:user_id]
  end
end
