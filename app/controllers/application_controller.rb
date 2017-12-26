class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def welcome
		@user = current_user
	end

  def oauthError

  end
end
