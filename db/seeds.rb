# db/seeds.rb

require 'faker'

# Create 15 topics
topics = []
15.times do
  topics << Topic.create(
    name: Faker::Lorem.sentence, 
    description: Faker::Lorem.paragraph
  )
end


# Create 5 users with their own posts
5.times do
  password = Faker::Lorem.characters(10)
  user = User.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email, 
    password: password, 
    password_confirmation: password)
  user.skip_confirmation!
  user.save

  # Note: by calling `User.new` instead of `create`,
  # we create an instance of a user which isn't saved to the database.
  # The `skip_confirmation!` method sets the confirmation date
  # to avoid sending an email. The `save` method updates the database.

5.times do
    topic = topics.first
    post = Post.create(
      user: user,
      topic: topic,
      title: Faker::Lorem.sentence, 
      body: Faker::Lorem.paragraph)
    # set the created_at to a time within the past year
    post.update_attribute(:created_at, Time.now - rand(600..31536000))

    topics.rotate!
  end
end

5.times do
    topic = topics.first
    post = Post.create(
      user: user,
      topic: topic,
      title: Faker::Lorem.sentence, 
      body: Faker::Lorem.paragraph)
    # set the created_at to a time within the past year
    post.update_attribute(:created_at, Time.now - rand(600..31536000))

    topics.rotate!
  end
end

# Create Comments
100.times do
  comment = Comment.create(
    user: users.sample,
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )

  # set the created_at to a time within the past year
  comment.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end



user = User.first
user.skip_reconfirmation!
user.update_attributes(email: 'tomkarels@gmail.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')

# db/seeds.rb

# Create an admin user
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
admin.skip_confirmation!
admin.save
admin.update_attribute(:role, 'admin')

# Create a moderator
moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
moderator.skip_confirmation!
moderator.save
moderator.update_attribute(:role, 'moderator')

# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com', 
  password: 'helloworld', 
  password_confirmation: 'helloworld')
member.skip_confirmation!
member.save

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"