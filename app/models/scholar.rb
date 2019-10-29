class Scholar < ApplicationRecord
  belongs_to :country
  belongs_to :region
  has_many :scholar_edit

  validates :first_name, :last_name, :email, :publications, presence: true

  paginates_per 10

  def self.search(search_term)
search_query = "LOWER(first_name) = :search_term or LOWER(last_name) = :search_term or \
LOWER(affiliation) LIKE :search_term or LOWER(countries_of_specialization) LIKE :search_term or \
LOWER(education) LIKE :search_term or LOWER(research_interests) LIKE :search_term or \
LOWER(teaching_interests) LIKE :search_term or LOWER(publications) LIKE :search_term or LOWER(keywords) LIKE :search_term"
# Scholar.where("first_name = :search_term or last_name = :search_term", search_term: search_term.downcase)
    Scholar.where(search_query, search_term: search_term.downcase)
  end
end
