class SessionsController < ApplicationController

  before_action :user, only: [:create]

  def new
    if current_user
      redirect_to user_path(current_user), alert: t(".alert")
    end
  end

  def create
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: t(".notice")
    else
      flash[:alert] = t(".alert")
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: t(".notice")
  end

  private

  def user
    @user ||= User.find_by(email: params[:session][:email])
  end
end
