class Book < ApplicationRecord
  has_one_attached :thumbnail 
  validates :title, :isbn, :author, :thumbnail, :description, :state, presence: true

  belongs_to :user
end
