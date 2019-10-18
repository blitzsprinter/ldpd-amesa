class Scholar < ApplicationRecord
  belongs_to :country
  belongs_to :region
  has_many :scholar_edit

  validates :first_name, :last_name, :email, :publications, presence: true

  paginates_per 10
end
