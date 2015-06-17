class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

   def self.authenticate_email(email, password)
    @user = User.find_by(email: email)
    if @user
      User.authenticate_password(password)
    end
  end

  def self.authenticate_password(password)
    if @user.password == password
      @user
    end
  end

end
