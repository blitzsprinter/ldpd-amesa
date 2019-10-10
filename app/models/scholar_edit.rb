class ScholarEdit < ApplicationRecord
  belongs_to :scholar
  belongs_to :country
  belongs_to :region
end
