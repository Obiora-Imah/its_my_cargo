class Shipper < ApplicationRecord
  has_many :bookings
  has_many :shipments
end