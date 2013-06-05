get '/profile_page/:id' do
  @user_urls = User.find(params[:id]).urls
  erb :profile_page
end


post '/create_account' do
  user = User.create(params[:user])
  login(user)
  redirect back
end
