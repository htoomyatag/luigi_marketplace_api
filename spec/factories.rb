FactoryBot.define do


  factory :user do
    username { Faker::Name.unique.name }
    password { 'password' }
    author_pseudonym { Faker::Book.author } 
  end

  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph }
    cover_image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    user
  end



end



    