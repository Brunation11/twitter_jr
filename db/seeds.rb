# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    username: Faker::Internet.user_name(10),
    password: Faker::Internet.password(10),
    handle: Faker::Hipster.word
  )
end

users = User.all

10.times do
  users.each do |user|
    u = users.sample
    u.followees << user
    user.followers << u
  end
end

10.times do
  users.each do |user|
    user.tweets.create(
      content: (Faker::Hipster.sentence + "#test")
    )
  end
end

