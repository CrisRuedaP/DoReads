class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  validates :email, presence: true, uniqueness: true
  validates :name, :password, presence: true

  has_many :books
  has_many :libraries

end
