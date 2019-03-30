class Comment < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  acts_as_votable

end
