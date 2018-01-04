# frozen_string_literal: true

class UsersController < ApplicationController
  def index
<<<<<<< HEAD
    @users = User.all.sort_by { |user| user.name.downcase }
=======
    @users = User.all.sort_by {|user| user.name.downcase}
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
  end

  def new
    if !current_user
      @user = User.new
    else
<<<<<<< HEAD
      redirect_to user_path(current_user), notice: 'You are already signed in'
=======
      redirect_to user_path(current_user), notice: "You are already signed in"
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
<<<<<<< HEAD
      redirect_to root_path, notice: 'You have successfully joined Budget App'
=======
      redirect_to root_path, notice: "You have successfully joined Budget App"
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7
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
<<<<<<< HEAD
      format.html do
        redirect_to users_path,
                    notice: 'User was successfully deleted'
      end
    end
  end

  private
=======
      format.html {redirect_to users_path, notice: "User was successfully deleted"}
    end
  end

private
>>>>>>> 2b74537335135625450d28b60e1fd6bedd0b4ba7

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :uid, :password)
  end
end
