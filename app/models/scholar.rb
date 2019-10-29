class Scholar < ApplicationRecord
  belongs_to :country
  belongs_to :region
  has_many :scholar_edit

  validates :first_name, :last_name, :email, :publications, presence: true

  paginates_per 10

  def self.search(search_term)
    Scholar.where("LOWER(first_name) = :search_term or LOWER(last_name) = :search_term", search_term: search_term.downcase)
  end
end
