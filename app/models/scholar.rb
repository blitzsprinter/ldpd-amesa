class Scholar < ApplicationRecord
  belongs_to :country
  belongs_to :region
  has_many :scholar_edit

  paginates_per 10
end
