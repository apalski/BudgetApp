# frozen_string_literal: true

module SessionHelper
  def set_session_id
    if (auth_hash = request.env['omniauth.auth'])
      @user = User.create_with_omniauth(auth_hash)
      session_id
    else
      not_omniauth
    end
  end

  def not_omniauth
    @user = User.find_by(name: params[:user][:name])
    if @user&.authenticate(params[:user][:password])
      session_id
    else
      flash[:notice] = 'Please check your name and password and try again'
      redirect_to new_session_path
    end
  end

  def session_id
    session[:user_id] = @user.id
    redirect_to root_path
  end
end
