# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(name: 'Gaby', email: 'gaby@gmail.com', password: '123456')
User.create!(name: 'izzy', email: 'izzy@gmail.com', password: '123456')
User.create!(name: 'lucien', email: 'lucien@gmail.com', password: '123456')
User.create!(name: 'ife', email: 'ife@gmail.com', password: '123456')

10.times do
  Boat.create!(
    name: Faker::Pokemon.name,
    description: Faker::Lorem.paragraph,
    location: Faker::Address.street_address,
    capacity: rand(0..10),
    length: rand(0..1000),
    price_per_week: rand(0..1000),
    category: ['Sail Boat', 'Motor Boat'].sample,
    user: User.all.sample
  )
end

10.times do
  Review.create!(
    content: Faker::Lorem.paragraph,
    rating: rand(1..5),
    boat: Boat.all.sample,
    user: User.all.sample
    )
end

10.times do
  Booking.create!(
    start_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    end_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
    boat: Boat.all.sample,
    user: User.all.sample
    )
end



