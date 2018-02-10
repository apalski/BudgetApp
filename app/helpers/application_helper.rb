module ApplicationHelper
  def self.find(id)
    User.find_by(id: id) || NullUser.new
  end

  def current_user
    if session[:user_id]
      @current_user ||= find(id: session[:user_id])
    end
  end
end
