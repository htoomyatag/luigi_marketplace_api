class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :description, :price
  belongs_to :user

  attribute :cover_image_url do |object|
    "#{object.cover_image}"
  end
  
end
