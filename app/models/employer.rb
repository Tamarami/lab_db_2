class Employer < ApplicationRecord

  belongs_to :region, optional: true
  has_many :vacancies, dependent: :destroy
  scope :ordered, -> { order(:name) }

end
