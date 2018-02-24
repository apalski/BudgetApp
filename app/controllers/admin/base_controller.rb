module Admin
  class BaseController < ApplicationController
    before_action :require_login
    before_action :require_admin

    private

    def require_admin
      unless current_user.admin?
        if current_user
          redirect_to users_path, alert: I18n.t(
            "admin.defaults.require_admin"
          )
        else
          redirect_to new_session_path, alert: I18n.t(
            "admin.defaults.require_admin"
          )
        end
      end
    end
  end
end
