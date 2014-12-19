require 'faker'

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save
end
users = User.all

100.times do
  Website.create!(
    address: Faker::Internet.url,
    user: users.sample
  )
end

puts "#{User.count} users created."
puts "#{Website.count} websites created."
