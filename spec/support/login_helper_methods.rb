def log_in_as(user, options = {})
  password    = options[:password]    || 'password'
  remember_me = options[:remember_me] || '1'
  session[:user_id] = user.id
end
