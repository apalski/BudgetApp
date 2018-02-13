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

  def logged_in?
    session[:user_id].present?
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: I18n.t("sessions.new.logged_in")
    end
  end

  private

  protect_from_forgery with: :exception
end
