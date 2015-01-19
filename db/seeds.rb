require 'faker'

User.delete_all
Website.delete_all

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

generator = -> (start_time, end_time) {
  time = Time.at(rand(start_time.to_i - end_time.to_i) + start_time.to_i)
  website = Website.new(name: Faker::Lorem.sentence,
                        description: Faker::Lorem.paragraph,
                        address: Faker::Internet.url,
                        user: users.sample)
  website.created_at = time
  website.save!
}
# 100.times do
#   Website.create!(
#     name: Faker::Name.name,
#     description: Faker::Lorem.sentence,
#     address: Faker::Internet.url,
#     user: users.sample
#   )
# end
100.times { generator.call(10.days.ago, Time.zone.now.end_of_day) }

puts "#{User.count} users created."
puts "#{Website.count} websites created."
