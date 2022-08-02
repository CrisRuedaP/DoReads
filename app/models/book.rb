class Book < ApplicationRecord
  has_one_attached :thumbnail 
  validates :title, :author, :thumbnail, presence: true
  #validates :title, :isbn, :author, :thumbnail, :description, :state, presence: true  - Google books api

  belongs_to :user
  has_many :libraries
  has_many :added_books, through: :libraries, source: :user
end
