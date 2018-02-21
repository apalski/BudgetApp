module Admin
  class BaseController < ApplicationController
    before_action :require_login
    before_action :require_admin

    private

    def require_admin
      unless current_user.admin?
        redirect_to new_session_path, alert: I18n.t(
          "admin.users.index.require_admin"
        )
      end
    end
  end
end
