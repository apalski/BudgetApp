class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_with @user, location: -> { new_session_path }
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to users_path, notice: I18n.t(
        "flash.actions.update.notice",
        resource_name: "User"
      )
    else
      flash[:alert] = I18n.t("flash.actions.update.alert", resource_name: "User")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :uid)
  end
end
