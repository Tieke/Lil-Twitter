require 'faker'

Post.destroy_all
User.destroy_all
UserRelationship.destroy_all


User.create(name: "admin", email: "a@b.c", password: "qwerty")

10.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.characters(3), description: Faker::Lorem.sentence)
end


user_ids = User.pluck("id")


100.times do
	Post.create(user_id: user_ids.sample, content: Faker::Hacker.say_something_smart)
	sleep 0.01
endcd

# posts_ids = Post.pluck("id")

# posts_ids.each do |post_id|
# 	my_post = Post.find_by_id(post_id)
# 	my_post.created_at = Faker::Time.between(DateTime.now - 50, DateTime.now)
# end


user_ids.each do |user_id|
	my_id = []
	my_id << user_id
	other_ids = user_ids - my_id
	rand(5).times do
		UserRelationship.create(leader_id: other_ids.sample, follower_id: user_id)
	end
end