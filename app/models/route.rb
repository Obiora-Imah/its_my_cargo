class Route < ApplicationRecord
has_many :bookings
has_many :shipments
has_many :freights
end