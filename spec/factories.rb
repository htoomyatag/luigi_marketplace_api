FactoryBot.define do

  factory :role do
    name { "Seller" }
  end

  factory :user do
    name { Faker::Name.unique.name }
    author_pseudonym { Faker::Book.author } 
    role
  end

  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    cover_image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    user
  end



end



    