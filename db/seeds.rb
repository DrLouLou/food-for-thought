# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Booking.destroy_all
Dinner.destroy_all
User.destroy_all

puts 'Creating dinners...'
guest_user_log_in = User.create(email: 'zach@gmail.com', password: '111111')
host_user_log_in = User.create(email:'tom@gmail.com', password:'111111')
cuisine = ['Italian', 'Spanish', 'Mexican', 'Chinese', 'Indian']
dishes = {
  'Italian' => %w[Pizza Pasta Bruschetta],
  'Spanish' => %w[Tapas Morcilias Paella Alhambra Patanegra Polpo],
  'Mexican' => %w[Tacos Burritos Salad Guacamole Nachos Margarita],
  'Chinese' => %w[Ramen Friedrice Wok Bun Dimsum Dumpling],
  'Indian' => %w[Curry Masala Naan Lassie Rice]
}
500.times do |dinner|
  current_cuisine = cuisine.sample
  dish = dishes[current_cuisine].sample
  url = "https://source.unsplash.com/1600x900?Food,#{current_cuisine},#{dish}"
  dinners = Dinner.create!(
    user: guest_user_log_in && host_user_log_in,
    location: 'London',
    cuisine: current_cuisine,
    capacity: 1,
    price: rand(2..5),
    title: dish,
    datetime: Date.today,
    image_url: url
  )
end

puts 'Finished!'



