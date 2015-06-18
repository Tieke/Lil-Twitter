get '/' do
  if session[:user_id]
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
