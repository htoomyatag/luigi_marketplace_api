class BookSerializer
  include JSONAPI::Serializer
  belongs_to :user
	attributes :title, :description, :price
  attribute :cover_image_url do |object|
    "#{object.cover_image}"
  end
end