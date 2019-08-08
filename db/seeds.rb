# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Creating Users"

5.times do
  User.create(email: Faker::Internet.safe_email, password: "123456789")
end

puts "You now have #{User.count} users"

puts "creating between 5 & 10 fake URLs per user"

users = User.all

users.each do |user|
  rand(5...10).times do
    a = Url.new
    a.original = Faker::Internet.url
    a.custom_short = [*('A'..'Z'),*('a'..'z')].sample(5).join
    a.user_id = user.id
    a.save!
  end
end

puts "created a total of #{Url.count} urls"
