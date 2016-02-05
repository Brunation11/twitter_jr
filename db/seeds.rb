# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  User.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10),
    handle: Faker::Hipster.word
  )
end

users = User.all

50.times do
  users.each do |user|
    u = users.sample
    u.follow(user)
  end
end

hashtags = []

50.times do
  hashtags << "##{Faker::Hipster.word}"
end


50.times do
  users.each do |user|
    user.tweets.create(
      content: (Faker::Hipster.sentence + hashtags.sample(rand(1..5)).join(" "))
    )
  end
end

