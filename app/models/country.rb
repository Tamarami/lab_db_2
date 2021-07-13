class Country < ApplicationRecord

  has_many :cities, foreign_key: 'country_code', dependent: :destroy
  validates :country_code, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :country_name, presence: true, uniqueness: true

end
