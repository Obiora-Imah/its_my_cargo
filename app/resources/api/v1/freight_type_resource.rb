class Api::V1::FreightTypeResource < JSONAPI::Resource
  has_many :freights
  has_many :bookings
end
