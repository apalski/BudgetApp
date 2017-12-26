class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include ApplicationHelper, SessionHelper

  def welcome
		@user = current_user
	end
end
