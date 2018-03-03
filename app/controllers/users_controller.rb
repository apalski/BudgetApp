class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
    end

    respond_with @user, location: -> { new_session_path }
  end

  def show
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
      :name,
      :email,
      :password,
      :uid,
      :email_confirmation
    )
  end
end
