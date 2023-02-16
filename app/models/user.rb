class User < ApplicationRecord
	has_many :books
  validates :username, uniqueness: true
end
