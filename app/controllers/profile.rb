get '/user/:id/profile' do
  @user = User.find(params[:id])
  @posts = @user.posts.order(created_at: :desc)
  erb :profile
end

