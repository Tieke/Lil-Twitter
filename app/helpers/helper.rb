def user_can_edit?
  @user.id == session[:user_id]
end
