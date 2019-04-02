class Category < ApplicationRecord
  has_many :problems
  has_many :comments, through: :problems
end
