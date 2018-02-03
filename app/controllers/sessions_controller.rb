class SessionsController < ApplicationController

  before_action :user, only: [:create]

  def new
    if current_user
      redirect_to user_path(current_user), alert: I18n.
        t("flash.actions.create.alert", resource_name: "Session")
    end
  end

  def create
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      create_notice
      redirect_to user_path(user)
    else
      create_alert
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = I18n.
      t("flash.actions.destroy.notice", resource_name: "Session")
    redirect_to root_path
  end

  private

  def user
    User.find_by(email: params[:session][:email])
  end

  def create_alert
    flash[:alert] = I18n.
      t("flash.actions.create.alert", resource_name: "Session")
  end

  def create_notice
    flash[:notice] = I18n.
      t("flash.actions.create.notice", resource_name: "Session")
  end
end
