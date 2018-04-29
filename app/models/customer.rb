class Customer < ApplicationRecord
  has_many :bookings
  has_many :shipments

end
