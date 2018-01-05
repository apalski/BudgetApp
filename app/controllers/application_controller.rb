# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_filter :set_locale

  include SessionHelper
	include LocaleSetter

  def welcome
    @user = current_user
  end

private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

	def set_locale
		I18n.locale = LocaleSetter.from_param(params[:locale]) ||
      LocaleSetter.from_http(request.env["HTTP_ACCEPT_LANGUAGE"])
  end

	def default_url_options(options = {})
	  { locale: I18n.locale }.merge(options)
	end
end
