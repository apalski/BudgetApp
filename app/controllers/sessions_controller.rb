# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
<<<<<<< HEAD
    return unless current_user
    redirect_to user_path(current_user),
                notice: 'You are already signed in'
=======
    if current_user
      redirect_to user_path(current_user),
        notice: "You are already signed in"
    end
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
  end

  def create
    set_session_id
  end

  def destroy
    session.clear
    respond_to do |format|
<<<<<<< HEAD
      format.html do
        redirect_to new_session_path,
                    notice: 'You are signed out'
      end
=======
      format.html { redirect_to new_session_path,
                    notice: "You are signed out" }
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
    end
  end
end
