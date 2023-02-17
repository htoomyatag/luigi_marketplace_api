require 'faker'

User.create(
	username: "luigi",
	password: "password",
	author_pseudonym: "Mario",
	is_admin: true
)

5.times do
	User.create(
		username: Faker::Name.unique.name, 
		password: 'password',
		author_pseudonym: Faker::Book.author
	)
end

7.times do
	Book.create(
		title: Faker::Book.title, 
		description: Faker::Lorem.paragraph, 
		cover_image: Faker::LoremFlickr.image,
		price: Faker::Commerce.price,
		user_id: rand(2..6)
	)
end