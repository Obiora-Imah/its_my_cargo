class Api::V1::ShipmentResource < JSONAPI::Resource
	attributes :open, :completed, :total_received

  has_many :freights

  def open
    Shipment.where(status: "open").count
  end

  def completed
    Shipment.where(status: "completed").count
  end

  def total_received
    Shipment.where(status: ["completed", "accepted"]).count
  end
end
