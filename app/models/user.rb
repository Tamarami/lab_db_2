class User < ApplicationRecord

  has_many :resumes, dependent: :destroy
  scope :ordered, -> { order(:name) }

end
