class Region < ApplicationRecord

  has_many :employers
  has_many :vacancies
  has_many :resumes
  scope :ordered, -> { order(:code) }

  def to_s
    self.name
  end

end
