FactoryBot.define do

  Role.create([{ name: "Administrator" }, { name: "Seller" }])
  
  factory :create_user, class: User do
    author_pseudonym { Faker::Book.author }
    name { Faker::Name.unique.name }
    password { "password" }
    role_id { 2 }
  end

  factory :create_book, class: Book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    user_id { rand(1..10) }
    cover_image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
  end

end



    