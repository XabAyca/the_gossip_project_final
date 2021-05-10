# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableTagGossip.destroy_all
Comment.destroy_all
Like.destroy_all
PrivateMessage.destroy_all
JoinTablePmRecipient.destroy_all


10.times do |i|
  City.create(name:Faker::Games::Fallout.location,zip_code:Faker::Address.zip_code)
  puts "#{i+1} cities created"
end

puts "*"*20

10.times do |i|
  User.create(first_name:Faker::Games::Pokemon.name,last_name:Faker::Games::SuperMario.character,description:Faker::Movies::BackToTheFuture.quote,email:Faker::Internet.email,age:rand(6..99),city_id:City.all.sample.id)
  puts "#{i+1} users created"
end

puts "*"*20

20.times do |i|
  Gossip.create(title:Faker::DcComics.title,content:Faker::ChuckNorris.fact,user_id:User.all.sample.id)
  puts "#{i+1} gossips created"
end

puts "*"*20

10.times do |i|
  Tag.create(title:Faker::Color.color_name)
  puts "#{i+1} tags created"
end

puts "*"*20

Gossip.all.each do |gossip|
  JoinTableTagGossip.create(tag_id:Tag.all.sample.id,gossip_id:gossip.id)
  puts "ID #{gossip.id} tags<=>gossips created"
end

puts "*"*20

20.times do |i|
  Comment.create(content:Faker::GreekPhilosophers.quote,user_id:User.all.sample.id,gossip_id:Gossip.all.sample.id)
  puts "#{i+1} comments created"
end

puts "*"*20

20.times do |i|
  result = rand(1..2)
  if result == 1
    Like.create(user_id:User.all.sample.id,comment_id:Comment.all.sample.id)
    puts "+1 like to a comment"
  else
    Like.create(user_id:User.all.sample.id,gossip_id:Gossip.all.sample.id)
    puts "+1 like to a gossip"
  end
end

puts "*"*20

10.times do |i|
  pm = PrivateMessage.create(content:Faker::Movies::Lebowski.quote,sender_id:User.all.sample.id)
  group = rand(1..3)
  group.times do |u|
    JoinTablePmRecipient.create(private_message:pm,recipient_id:User.all.sample.id)
  end
  puts "One New message send, to #{group} personn..."
end

puts "*"*20








