module Admin
  class UsersController < BaseController
    def index
      @users = User.by_admin
    end

    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)

      respond_with @user, location: -> { admin_users_path }
    end

    def edit
    end

    def update
      user.update_attributes(user_params)

      respond_with user, location: -> { admin_users_path }
    end

    def destroy
      user.delete
      flash[:notice] = I18n.t(
        "flash.actions.destroy.notice",
        resource_name: "User"
      )

      redirect_to admin_users_path
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
