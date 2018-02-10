module Helpers
  def log_in_as(user, options = {})
    options[:password]
    options[:email]
    session[:user_id] = user.id
  end

  def feature_log_in_as(user)
    visit new_session_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_on I18n.t("sessions.new.submit")
  end
end
