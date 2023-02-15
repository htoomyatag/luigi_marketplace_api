class Book < ApplicationRecord
	belongs_to :user
	validates :title, :user_id, :cover_image, :price, presence: true
	validates :title, length: { maximum: 150 }
	validates :description, length: { maximum: 300 }
	validates :cover_image, url: true
	
end
