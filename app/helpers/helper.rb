helpers do
  def current_user
    @current_user ||= User.find_by_id(session[:current_user])
  end

  def login(user)
    session[:current_user] = user.id
  end

  def logout
    session.clear
  end
end
