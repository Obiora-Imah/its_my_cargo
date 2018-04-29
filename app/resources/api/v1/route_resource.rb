class Api::V1::RouteResource < JSONAPI::Resource
  attributes :origin, :destination, :most_requested_route

  def origin(port_id = nil)
    ports  = Port.find_by(id: port_id || @model.origin_port)
    ports.attributes.except("id", "created_at", "updated_at")
  end

  def destination(port_id = nil)
    ports = Port.find_by(id: port_id || @model.destination_port)
    ports.attributes.except("id", "created_at", "updated_at")
  end

  def most_requested_route
  	max_value_map = Freight.group(:route_id)&.order('route_id DESC')&.count(:route_id)&.max_by{|k,v| v}
  	popular_route = Route.find_by(id: max_value_map[0]) if max_value_map
  	from = origin(popular_route.origin_port)
  	to = destination(popular_route.destination_port)

  	{
  		From: "#{from["name"]}, #{from["country"]}",
  		to: "#{to["name"]}, #{to["country"]}"
  	}
  end
end
