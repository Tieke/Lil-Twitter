# get '/user/:user_id/post' do
#   @user = User.find(params[:user_id])
#   erb :create_post
# end

post '/user/:id/post' do
  # return params.inspect
  @user = User.find(params[:id])
  post = @user.posts.create(content: params[:content])
  redirect "/user/'#{@user.id}'/profile"
end

# post '/user/1/post' do
#   "Hello World"
# end
