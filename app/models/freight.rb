class Freight < ApplicationRecord
  has_many :shipment
  belongs_to :route
end
