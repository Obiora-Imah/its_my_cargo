class Shipment < ApplicationRecord
  belongs_to :freight
  belongs_to :customer
  belongs_to :shipper
  belongs_to :route

end