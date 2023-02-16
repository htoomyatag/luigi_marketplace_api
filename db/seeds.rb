require 'faker'

User.create(
	name: "luigi",
	author_pseudonym: "Mario",
	email: "luigi@gmail.com",
	password: "password",
	is_admin: true)

5.times do
	User.create(
		name: Faker::Name.unique.name, 
		author_pseudonym: Faker::Book.author, 
		email: Faker::Internet.email,
	    password: 'password')
end

7.times do
	Book.create(
	   	title: Faker::Book.title, 
	   	description: Faker::Lorem.paragraph, 
		cover_image: Faker::LoremFlickr.image,
		price: Faker::Commerce.price,
		user_id: rand(2..6))
end
