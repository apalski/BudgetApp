module Admin
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def edit
    end

    def update
      user.update_attributes(user_params)

      respond_with user, location: -> { admin_user_path(user) }
    end

    def destroy
      user.delete

      respond_with user, location: -> { new_admin_user_path }
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :uid, :admin)
    end

    def user
      @user ||= User.find(params[:id])
    end
    helper_method :user
  end
end
