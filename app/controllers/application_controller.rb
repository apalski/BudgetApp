require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def require_admin
    unless admin?
      redirect_to user_path(current_user), alert: I18n.t(
        "users.index.require_admin"
      )
    end
  end

  def admin?
    current_user.admin?
  end
  helper_method :admin?

  protect_from_forgery with: :exception
end
