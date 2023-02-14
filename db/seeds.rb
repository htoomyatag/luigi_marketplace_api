require 'faker'

Role.create([{ name: "Administrator" }, { name: "Seller" }])
User.create(name: "luigi",password: "password",role_id:1)

5.times do
	User.create(
		author_pseudonym: Faker::Book.author, 
	    name: Faker::Name.unique.name, 
	    password: 'password', 
	    role_id: 2)
end

7.times do
	Book.create(
	   	title: Faker::Book.title, 
	   	description: Faker::Lorem.paragraph, 
		user_id: rand(1..5),
		cover_image: Faker::LoremFlickr.image,
		price: Faker::Commerce.price)
end
