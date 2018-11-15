# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning up database...'
Photo.destroy_all
Review.destroy_all
Booking.destroy_all
Boat.destroy_all
User.destroy_all

puts 'Creating users...'
User.create!(name: 'Gaby', email: 'gaby@gmail.com', password: '123456')
User.create!(name: 'izzy', email: 'izzy@gmail.com', password: '123456')
User.create!(name: 'lucien', email: 'lucien@gmail.com', password: '123456')
User.create!(name: 'ife', email: 'ife@gmail.com', password: '123456')
puts 'Users created!'
# photos = ['https://images.unsplash.com/photo-1528154291023-a6525fabe5b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a43bfc679e76d65767fa0f25c223eaec&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1534619039567-4db91b8d7e31?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=12bb20e846a433b36a0be8c1b166fe4e&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1512602110-67198e50f815?ixlib=rb-0.3.5&s=c11f4db2462e3099db163d05e2aaea7e&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1510272440556-215041fca05c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3a5080d4a97908ca3282bcf16a90adf8&auto=format&fit=crop&w=500&q=60', 'https://images.unsplash.com/photo-1491316713428-0cbd516756a3?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=00fe20f52e16bd1e9b5c650d7b94ad2b&auto=format&fit=crop&w=500&q=60']



# 10.times do
#   boat = Boat.new(
#     name: Faker::Pokemon.name,
#     description: Faker::Lorem.paragraph,
#     location: Faker::Address.street_address,
#     capacity: rand(0..10),
#     length: rand(0..1000),
#     price_per_week: rand(0..1000),
#     category: ['Sail Boat', 'Motor Boat'].sample,
#     user: User.all.sample
#   )
#   if boat.save!
#     photos.each do |uri|
#       photo = boat.photos.create()
#       photo.url = uri
#       photo.save!
#     end
#   end
# end

# 10.times do
#   Review.create!(
#     content: Faker::Lorem.paragraph,
#     rating: rand(1..5),
#     boat: Boat.all.sample,
#     user: User.all.sample
#     )
# end

# 10.times do
#   Booking.create!(
#     start_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
#     end_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
#     boat: Boat.all.sample,
#     user: User.all.sample
#     )
# end





