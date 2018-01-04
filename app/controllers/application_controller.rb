# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionHelper
  include ApplicationHelper

  def welcome
    @user = current_user
  end
<<<<<<< HEAD

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
=======
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
end
