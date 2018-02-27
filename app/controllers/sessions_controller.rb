class SessionsController < ApplicationController
  before_action :user, only: [:create]

  def new
    if current_user
      redirect_to users_path, alert: t(".flash.alert")
    end
  end

  def create
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_users_path, notice: t(".flash.notice")
      else
        redirect_to users_path, notice: t(".flash.notice")
      end
    else
      flash[:alert] = t(".flash.alert")
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: t(".flash.notice")
  end

  private

  def user
    @user ||= User.find_by(email: params[:session][:email])
  end
end
