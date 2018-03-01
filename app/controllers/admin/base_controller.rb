module Admin
  class BaseController < ApplicationController
    before_action :require_login
    before_action :require_admin

    private

    def require_admin
      unless current_user.admin?
        redirect_to users_path, alert: I18n.t(
          "admin.defaults.require_admin"
        )
      end
    end
  end
end
