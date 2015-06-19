get '/user/:id/profile' do
  @user = User.find(params[:id])
  @posts = @user.posts.order(created_at: :desc)
  erb :profile
end

post '/unfollow/:id' do
  follower = User.find(session[:user_id])
  leader = User.find(params[:id])
  follower.unfollow_user(leader)
  redirect '/'
end

post '/unfollow/leaders/:id' do
  follower = User.find(session[:user_id])
  leader = User.find(params[:id])
  follower.unfollow_user(leader)
  redirect "/user/#{session[:user_id]}/feed"
end