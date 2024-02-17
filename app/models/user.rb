class User < ApplicationRecord
 has_many :tasks, through: :user_books
 has_many :user_books
end
