helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate!
    redirect '/sessions/new' unless logged_in?
  end

  def authorize
    session[:user_id] == params[:id]
  end

end