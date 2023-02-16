require 'csv'

class Book < ApplicationRecord
	include Searchable
	belongs_to :user
	validates :title, :user_id, :cover_image, :price, presence: true
	validates :title, length: { maximum: 150 }
	validates :description, length: { maximum: 300 }
	validates :cover_image, url: true
	

	 def self.import(file)
	   CSV.foreach(file.path, headers: true) do |row|
	     book = Book.new(row.to_hash)
	     return false unless book.valid?
	     book.save
	   end  
	 end

end
