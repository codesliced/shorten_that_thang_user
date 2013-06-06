post '/login' do
  # we have a params[:user] which has { email: "something", password: "something" }
  # query database for a User object whose email = params[:user][:email]
  # if nobody is there, re-render same page, no login.
  # if user is returned, check user.password == params[:user][:password]
  #   login(user) if that's true
  potential_user = User.find_by_email(params["user"]["email"])
  if potential_user
    if potential_user.password == params["user"]["password"]
      login(potential_user)
      @user_urls = potential_user.urls
      @urls = Url.all
      @username = potential_user.email
      erb :list_of_urls
    else
      erb :index
    end
  else
    erb :index
  end
end

get '/logout' do
  logout 
  erb :index
end


