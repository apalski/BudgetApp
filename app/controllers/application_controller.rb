require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  helper_method :current_user

  def require_login
    unless current_user
      redirect_to new_session_path, alert: I18n.t(
        "sessions.new.flash.require_login",
      )
    end
  end

  def log_user_in
    session[:user_id] = @user.id
  end
end
