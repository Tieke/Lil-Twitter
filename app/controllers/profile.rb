get '/user/:id/profile' do
  @user = User.find(params[:id])
  @posts = @user.posts.all
  #this should just display own posts
  # @followers = @user.followers
  erb :profile
end


