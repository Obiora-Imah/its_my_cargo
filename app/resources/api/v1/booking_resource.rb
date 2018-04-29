class Api::V1::BookingResource < JSONAPI::Resource
	attributes :status, :frieght_charge, :freight_capacity, :not_sold

	belongs_to :route
	belongs_to :shipper
  belongs_to :customer
  belongs_to :freight_type

	def freight_capacity
		@model.size
	end

	def not_sold
		_model.where(status: "closed")
	end
end
