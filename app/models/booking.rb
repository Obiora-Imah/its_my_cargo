class Booking < ApplicationRecord
  belongs_to :shipper
  belongs_to :customer
  belongs_to :freight_type
  belongs_to :route
end
