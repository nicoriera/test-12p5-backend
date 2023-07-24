# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
puts "Cleaning database..."
Bike.destroy_all
User.destroy_all
Subscription.destroy_all

puts "Creating seeds..."

puts "Creating bikes..."
bike_classic = Bike.create(bike_type: "bike_classic", price: 10.00)
bike_long = Bike.create(bike_type: "bike_long", price: 15.00)
bike_cargo = Bike.create(bike_type: "bike_cargo", price: 20.00)

puts "Creating users..."
user = User.create(name: "John Doe", email: "john.doe@example.com", password: "password")
admin = User.create(name: "Admin User", email: "admin@example.com", password: "password", role: "admin")

puts "Creating subscriptions..."
Subscription.create(user: user, bike: bike_classic, start_date: Date.today, end_date: Date.today + 1.month)

puts "Done!"