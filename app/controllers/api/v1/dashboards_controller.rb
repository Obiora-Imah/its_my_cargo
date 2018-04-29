class Api::V1::DashboardsController < Api::V1::BaseApiController
  
  def route_summary
    respond_to do |format|
      format.json { render json: { 
        popular_route: most_requested_route,
        popular_origin: most_popular_origin,
        popular_destination: most_popular_destination }}
    end
  end

  def popular_booking_time
    respond_to do |format|
      format.json { render json: { }}
    end
  end

  def freight_data
    respond_to do |format|
      format.json { render json: { 
        capacity_sold: capacity_sold,
        service_amount: amount_sold }}
    end
  end

  def shipment_data
    respond_to do |format|
      format.json { render json: shipment_by_status }
    end
  end

  def booking_data
    respond_to do |format|
      format.json { render json: booking_by_status }
    end
  end

  private

  def most_requested_route
    max_value_map = shipment_route&.count(:route_id)&.max_by{|k,v| v}
    popular_route = Route.find_by(id: max_value_map[0]) if max_value_map
    from = origin(popular_route.origin_port)
    to = destination(popular_route.destination_port)

    ["#{from["name"]}, #{from["country"]} => #{to["name"]}, #{to["country"]}",max_value_map[1]]
  end

  def most_popular_destination
    route_ids = shipment_route&.pluck(:route_id)
    route = Route.where(id: route_ids).group(:destination_port)&.order(destination_port: :desc)&.count(:destination_port)&.max_by{|k,v| v} if route_ids
    to = destination(route[0])

    ["#{to["name"]}, #{to["country"]}", route[1]]
  end

  def most_popular_origin
    route_ids = shipment_route&.pluck(:route_id)
    route = Route.where(id: route_ids).group(:origin_port)&.order(origin_port: :desc)&.count(:origin_port)&.max_by{|k,v| v} if route_ids
    from = origin(route[0])

    ["#{from["name"]}, #{from["country"]}", route[1]]
  end

  def shipment_route
    Shipment.group(:route_id)&.order('route_id DESC')
  end
  def origin(port_id = nil)
    ports  = Port.find_by(id: port_id)
    ports.attributes.except("id", "created_at", "updated_at")
  end

  def destination(port_id = nil)
    ports = Port.find_by(id: port_id)
    ports.attributes.except("id", "created_at", "updated_at")
  end

  def shipment_by_status
    Shipment.group(:status)&.count(:status)
  end

  def booking_by_status
    Booking.group(:status)&.count(:status)
  end

  def capacity_sold
    Freight.group(:freight_capacity, :freight_type)&.order('freight_capacity DESC').sum(:sold_capacity)
  end

  def amount_sold
    Freight.group(:freight_capacity, :freight_type)&.order('freight_capacity DESC').sum(:freight_rate)
  end
end
