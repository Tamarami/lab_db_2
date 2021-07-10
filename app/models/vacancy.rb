class Vacancy < ApplicationRecord

  belongs_to :employer
  belongs_to :region, optional: true
  belongs_to :handbook_vacancy, optional: true
  belongs_to :education, optional: true

  scope :ordered, -> { order(updated_at: :desc) }

end
