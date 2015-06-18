get '/user/:id/profile' do
  @user = User.find(params[:id])
  #this should just display own posts
  # @followers = @user.followers
  erb :profile
end


