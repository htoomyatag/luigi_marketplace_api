class User < ApplicationRecord
  require "securerandom"
  has_secure_password
  has_many :books
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end