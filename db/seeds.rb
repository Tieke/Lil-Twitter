require 'faker'

Post.destroy_all
User.destroy_all
UserRelationship.destroy_all

10.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Lorem.characters(3), description: Faker::Lorem.sentence)
end


user_ids = User.pluck("id")


100.times do
	Post.create(user_id: user_ids.sample, content: Faker::Hacker.say_something_smart)
end


user_ids.each do |user_id|
	my_id = []
	my_id << user_id
	other_ids = user_ids - my_id
	rand(5).times do
		UserRelationship.create(leader_id: other_ids.sample, follower_id: user_id)
	end
end