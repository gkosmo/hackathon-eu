class Comment < ApplicationRecord
  belongs_to :problem
  belongs_to :user, optional: true
  acts_as_votable
end
