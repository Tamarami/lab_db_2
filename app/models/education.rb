class Education < ApplicationRecord

  has_many :vacancies
  has_many :resumes
  scope :ordered, -> { order(:code) }

end
