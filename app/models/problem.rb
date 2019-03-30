class Problem < ApplicationRecord
  belongs_to :category
  belongs_to :user

  acts_as_taggable # Alias for acts_as_taggable_on :tags
end
