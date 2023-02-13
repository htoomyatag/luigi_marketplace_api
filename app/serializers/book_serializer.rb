class Book < ActiveModel::Serializer
	attributes :title, :description, :user_id, :cover_image, :price
end
