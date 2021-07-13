class Venue < ApplicationRecord

  has_many :events, foreign_key: 'venue_id', dependent: :destroy
  before_save :set_country_code

  def city
    City.where(postal_code: self.postal_code).first
  end

  private

  def set_country_code
    self.country_code = self.city.country_code
  end

end
