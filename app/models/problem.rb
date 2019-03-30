class Problem < ApplicationRecord
  belongs_to :category
  belongs_to :user
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  has_many :comments

  acts_as_votable

  include PgSearch

  pg_search_scope :global_search,
                  against: %i[title description],
                  associated_against: {
                    category: [:title],
                    comments: [:description],
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }

 def self.by_countries
    url = "https://restcountries.eu/rest/v2/regionalbloc/eu" 
    page_json =  HTTParty.get(url)
     countries = JSON.parse(page_json.body)
     countries_name_list = { }
     countries.each do  |country| 
         transl = country['translations'].map{|k, v|  v.downcase } 
         countries_name_list[country['name']]  =  Problem.tagged_with( [ country['name']&.downcase, country['altSpellings'].map(&:downcase), transl ].flatten, :any => true ).count 
     end
    countries_name_list
  end
end
