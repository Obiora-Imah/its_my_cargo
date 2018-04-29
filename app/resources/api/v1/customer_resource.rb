class Api::V1::CustomerResource < JSONAPI::Resource
	attributes :name, :location
	
  has_many :bookings
  has_many :freights
end
