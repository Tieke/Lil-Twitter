get '/' do
  if session[:user_id]
    @post = Post.order(created_at: :desc)
    @user = User.find(session[:user_id])
    @users = User.all
    erb :index
  else
    redirect '/login'
  end
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate_email(params[:email], params[:password])
  session[:user_id] = user.id
  redirect '/'
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/signup' do
  user = User.create(name:params[:name], email:params[:email], password:params[:password], image:params[:image], description:params[:description])
  session[:user_id] = user.id
  redirect '/'
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

