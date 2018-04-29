class Api::V1::FreightResource < JSONAPI::Resource
  attributes :freight_capacity, :amount, :freight_capacity_type

  belongs_to :shipment
  belongs_to :route
  belongs_to :customer
end
