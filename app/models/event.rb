class Event < ApplicationRecord

  belongs_to :venue, foreign_key: 'venue_id'

  def self.search(params)
    query = params[:query]
    venue_id = params[:venue_id]
    query_filter = query.blank? ? all : where('title ILIKE :query', query: "%#{query}%")
    venue_id_filter = venue_id.blank? ? all : where(venue_id: venue_id)
    query_filter.merge(venue_id_filter)
  end

end
