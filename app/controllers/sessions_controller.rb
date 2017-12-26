class SessionsController < ApplicationController

  def new
		if current_user
			redirect_to user_path(current_user), notice: "You are already signed in"
		end
	end

  def create
    set_session_id
	end

  def destroy
		session.clear
		respond_to do |format|
			format.html { redirect_to sessions_new_path, notice: "You are signed out" }
		end
	end
end
