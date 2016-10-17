class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def auth_user
    unless current_user.try(:is_admin)
      redirect_to root_path, alert: '無使用權限'
    end
  end

end
