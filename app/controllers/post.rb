get '/user/:user_id/post' do
  @user = User.find(params[:user_id])
  erb :create_post
end

post '/user/:id/post' do

end
