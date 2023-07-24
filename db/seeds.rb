# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
puts "Cleaning database..."
Subscription.destroy_all
Bike.destroy_all
User.destroy_all

puts "Creating seeds..."

puts "Creating bikes..."
bike_classic = Bike.create(bike_type: "Vélo classic", price: 10.00)
bike_long = Bike.create(bike_type: "Vélo long", price: 15.00)
bike_cargo = Bike.create(bike_type: "Vélo cargo", price: 20.00)

puts "Creating users..."
user = User.create(first_name: "John", last_name: "Doe",email: "john.doe@example.com", password: "password")
user_2 = User.create(first_name: "Jane", last_name: "Doe",email: "jane.doe@example.comn", password: "password")
user_3 = User.create(first_name: "Jack", last_name: "Doe",email: "jack.doe@example.com", password: "password")
admin = User.create(first_name: "Admin", last_name: "User", email: "admin@example.com", password: "password", role: "admin")

puts "Creating subscriptions..."
Subscription.create(user: user, bike: bike_classic, start_date: Date.today, end_date: Date.today + 1.month, period: "one_month")
Subscription.create(user: user_2, bike: bike_long, start_date: Date.today, end_date: Date.today + 6.month, period: "six_months")
Subscription.create(user: user_3, bike: bike_cargo, start_date: Date.today, end_date: Date.today + 12.month, period: "twelve_months")

puts "Done!"