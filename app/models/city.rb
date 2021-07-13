class City < ApplicationRecord

  self.primary_key  = :country_code, :postal_code
  belongs_to :country, foreign_key: [:country_code, :postal_code]
  has_many :venues, foreign_key: 'postal_code', dependent: :destroy

  validates :postal_code, presence: true, uniqueness: true, length: { maximum: 9 }

  def to_s
    self.country_code.to_s + ',' + self.postal_code.to_s
  end

end
