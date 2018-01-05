# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.sort_by { |user| user.name.downcase }
  end

  def new
    if !current_user
      @user = User.new
    else
      redirect_to user_path(current_user), notice: 'You are already signed in'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You have successfully joined Budget App'
    else
      render :new
    end
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user == current_user && @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    set_user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_path,
                    notice: 'User was successfully deleted'
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :uid, :password)
  end
end
