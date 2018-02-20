class AdminController < ApplicationController
  before_action :require_admin, only: [:index, :destroy]

  def admin?
    current_user.admin?
  end
  helper_method :admin?

  def require_admin
    unless admin?
      redirect_to admin_user_path(current_user), alert: I18n.t(
        "users.index.require_admin" # TODO: change once there's admin namespace
      )
    end
  end
end
