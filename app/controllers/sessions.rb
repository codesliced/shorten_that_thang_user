post '/login' do
  # we have a params[:user] which has { email: "something", password: "something" }
  # query database for a User object whose email = params[:user][:email]
  # if nobody is there, re-render same page, no login.
  # if user is returned, check user.password == params[:user][:password]
  #   login(user) if that's true

  # Push to the user model as an User.authenticate method
  user = User.authenticate(params[:user])
  if user
    puts session.inspect
    session[:current_user] = user.id
    redirect to('/profile_page/' + user.id)
  else
    :index
  end
end

get '/logout' do
  logout 
  erb :index
end


