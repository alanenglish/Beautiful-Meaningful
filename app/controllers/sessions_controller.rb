# inspect the session
get '/session-viewer' do
  session.inspect
end

# route to login with existing user
get '/sessions/new' do
  erb :'sessions/new'
end

# create a new session, find user by email address from form
post '/sessions' do
  @user = User.find_by(email: params[:email])
  # if the user exists and authenticates, create session and redirect home
  if @user && @user.authenticate(params[:password], params[:email])
    session[:user_id] = @user.id
    redirect "/restaurants"
  else
    # otherwise display custom error on login page
    @errors = ["There was trouble logging you in, please try again."]
    erb :'sessions/new'
  end
end

# logout user from the session
delete '/sessions' do
  session.delete(:user_id)
  redirect "/"
end