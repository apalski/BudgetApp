class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      respond_with(user)
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.clear
  end
end
