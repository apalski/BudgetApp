class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      log_user_in
    end

    respond_with @user, location: -> { new_session_path }
  end

  def show
    @expenses = current_user.expenses
  end

  def edit
  end

  def update
    current_user.update_attributes(user_params)

    respond_with current_user, location: -> { users_path }
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :email_confirmation,
      :name,
      :password,
      :uid,
    )
  end
end
