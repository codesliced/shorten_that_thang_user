helpers do
  def current_user
    !session[:current_user].nil?
  end

  def login(user)
    session[:current_user] = user.id
  end

  def logout
    session.clear
  end
end
