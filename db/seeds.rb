# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


Role.create([{ name: "Administrator" }, { name: "Seller" }])
User.create(name: "luigi",password: "password",role_id:1)

10.times do
    User.create(
    	author_pseudonym: Faker::Book.author, 
    	name: Faker::Name.unique.name, 
    	password: 'password', 
    	role_id: 2)

    50.times do
	   Book.create(
	   	title: Faker::Book.title, 
	   	description: Faker::Lorem.paragraph, 
		user_id: rand(1..10),
		cover_image: Faker::LoremFlickr.image,
		price: Faker::Commerce.price)
	end
end