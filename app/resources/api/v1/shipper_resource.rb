class Api::V1::ShipperResource < JSONAPI::Resource
  has_many :bookings
  has_many :shipments
end
