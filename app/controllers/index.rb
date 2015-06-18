get '/' do
  if session[:user_id]
    @post = Post.order(created_at: :desc)
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


