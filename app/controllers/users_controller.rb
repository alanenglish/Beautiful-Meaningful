# route to register a new user with form
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  # new user with params from form
  @user = User.new(params[:user])
  # if user saves successfully, create a session with their user id and redirect home
  if @user.save
    session[:user_id] = @user.id
    redirect "/restaurants"
  else
    # otherwise display errors on new view
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# use helper method to redirect to sessions new unless user logged in
get '/users/:id' do
  authenticate!
  erb :'users/show'
end
