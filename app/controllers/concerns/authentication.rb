module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    if (authenticated_user = User.find_by(id: cookies.signed[:marklog_session_id]))
      Current.user = authenticated_user
    else
      redirect_to sign_in_path
    end
  end
end
