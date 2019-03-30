class Problem < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments

  acts_as_votable
end
