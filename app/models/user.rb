class User < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def follow_user!(user_to_follow) #creates a relationship where u user can follow anoter user
    follower_id = self.id
    leader_id = user_to_follow.id
    UserRelationship.create(leader_id: leader_id, follower_id: follower_id)
  end

  def followers #to find followers for a user
    leader_id = self.id
    user_relationships = UserRelationship.where(leader_id: leader_id)
    followers_for_user = user_relationships.map do |relationship|
      User.find(relationship.follower_id)
    end
  end

  def leaders #to find the leaders for a user
    follower_id = self.id
    user_relationships = UserRelationship.where(follower_id: follower_id)
    leaders_for_user = user_relationships.map do |relationship|
      User.find(relationship.leader_id)
    end
  end

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
