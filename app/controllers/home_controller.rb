class HomeController < ApplicationController
  skip_before_action :authenticate

  def index
    redirect_to app_path if cookies.signed[:marklog_session_id]
  end
end
