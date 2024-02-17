class Task < ApplicationRecord
  has_many :users, through: :user_books
  has_many :user_books

  validates :name, :description, :price, :created_at, presence:true
end
