class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings

  extend Ratio::ClassMetods

  def city_openings(start_date, end_date)
    self.listings.select{ |listing| listing.reservations.where("checkout < start_date OR checkin > end_date")}
  end

end
