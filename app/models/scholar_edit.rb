class ScholarEdit < ApplicationRecord
  belongs_to :scholar
  belongs_to :country
  belongs_to :region

  paginates_per 10
end
