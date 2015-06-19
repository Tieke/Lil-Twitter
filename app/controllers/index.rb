get '/' do
  if session[:user_id]
    session[:error] = nil
    @posts = Post.order(created_at: :desc)
    @user = User.find(session[:user_id])
    @users = User.all
    erb :index
  else
    redirect '/login'
  end
end

get '/login' do
  # session[:error] = nil
  erb :login
end

post '/login' do
  if User.authenticate_email(params[:email], params[:password])
    user = User.authenticate_email(params[:email], params[:password])
    session[:user_id] = user.id
    session[:error] = nil
    redirect '/'
  else
    session[:error] = "Wrong username or password!"
    redirect '/login'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/signup' do
  user = User.create(name:params[:name], email:params[:email], password:params[:password], image:params[:image], description:params[:description])
  if user.valid?
    session[:user_id] = user.id
    session[:error] = nil
    user.save
    redirect '/'
  else
    session[:error] = "Please fill in all information in sign up!"
    redirect '/login'
  end
end

get '/user/:id/feed' do
  @user = User.find(params[:id])
  @leaders = @user.leaders
  erb :leaders_feed
end

post '/follow/:id' do
  follower_id = session[:user_id]
  follower = User.find(follower_id)
  # return params.inspect
  leader_id = params[:id]
  leader = User.find(leader_id)
  follower.follow_user!(leader)
  redirect '/'
end

