class CustomerRequest < ApplicationRecord
  belongs_to :service_category
  belongs_to :customer

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{address}, #{city}, #{state}, #{zipcode}"
  end

  def distance_from_current_company
    current_company
  end
end
