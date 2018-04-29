# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!([{
    name: "John Smith"
  },
  {
    name: "John Scott"
  },
  {
    name: "John McCathy"
  }
])

FreightType.create!([{
    name: "Air Freight"
  },
  {
    name: "Ocean Freight"
  },
  {
    name: "Rail Freight"
  }
])

Port.create!([{
    name: "Gothenburg Port",
    country: "Sweden"
  },
  {
    name: "Shanghai Port",
    country: "China"
  },
  {
    name: "Onne Port",
    country: "Nigeria"
  },
  {
    name: "Apapa Port",
    country: "Nigeria"
  }
])

Route.create!([{
    origin_port: 1,
    destination_port: 2
  },
  {
    origin_port: 1,
    destination_port: 3
  },
  {
    origin_port: 1,
    destination_port: 4
  },
  {
    origin_port: 2,
    destination_port: 1
  },
  {
    origin_port: 2,
    destination_port: 3
  },
  {
    origin_port: 2,
    destination_port: 4
  },
  {
    origin_port: 3,
    destination_port: 2
  },
  {
    origin_port: 3,
    destination_port: 1
  },
  {
    origin_port: 3,
    destination_port: 4
  },
  {
    origin_port: 4,
    destination_port: 1
  },
  {
    origin_port: 4,
    destination_port: 3
  },
  {
    origin_port: 4,
    destination_port: 2
  }
])

Shipper.create!([{
    name: "DHl"
  },
  {
    name: "USPS"
  },
  {
    name: "Fedex"
  }
])


Freight.create!([{
    freight_capacity: "20' Container",
    freight_rate: 134965.03,
    freight_type: "air",
    sold_capacity: 15,
    route_id: 1
  },
  {
    freight_capacity: "20' Container",
    freight_rate: 50785.30,
    freight_type: "air",
    sold_capacity: 10,
    route_id: 1
  },
  {
    freight_capacity: "40' Container",
    freight_rate: 50785.30,
    freight_type: "ocean",
    sold_capacity: 35,
    route_id: 1
  },
  {
    freight_capacity: "40' Container",
    freight_rate: 50785.30,
    freight_type: "rail",
    sold_capacity: 35,
    route_id: 1
  },
  {
    freight_capacity: "45' High Cube",
    freight_rate: 50785.30,
    freight_type: "rail",
    sold_capacity: 43,
    route_id: 2
  },
  {
    freight_capacity: "45' High Cube",
    freight_rate: 50785.30,
    freight_type: "air",
    sold_capacity: 43,
    route_id: 2
  }
])

Shipment.create!([{
    status: "accepted",
    shipper_id: 1,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "accepted",
    shipper_id: 1,
    charge: 200,
    weight: 500,
    freight_id: 2,
    route_id: 2,
    customer_id: 1

  },
  {
    status: "declined",
    shipper_id: 1,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "accepted",
    shipper_id: 2,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 2
  },
  {
    status: "declined",
    shipper_id: 2,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 2,
    customer_id: 1
  },
  {
    status: "declined",
    shipper_id: 2,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "declined",
    shipper_id: 2,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "accepted",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 2,
    route_id: 3,
    customer_id: 2
  },
  {
    status: "accepted",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 3
  },
  {
    status: "accepted",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 2,
    route_id: 1,
    customer_id: 3
  },
  {
    status: "accepted",
    shipper_id: 2,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 2,
    customer_id: 3
  },
  {
    status: "accepted",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "completed",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 3,
    customer_id: 1
  },
  {
    status: "completed",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "open",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 3,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "open",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 3,
    customer_id: 3
  },
  {
    status: "completed",
    shipper_id: 3,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "open",
    shipper_id: 1,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  },
  {
    status: "open",
    shipper_id: 1,
    charge: 200,
    weight: 500,
    freight_id: 1,
    route_id: 1,
    customer_id: 1
  }
])

Booking.create!([{
    size: "20` Container",
    status: "open",
    frieght_rate: 2900.98,
    route_id: 1,
    freight_type_id: 1,
    customer_id: 1,
    shipper_id: 1
  },
  {
    size: "40` Container",
    status: "sold",
    frieght_rate: 3400.98,
    route_id: 1,
    freight_type_id: 1,
    customer_id: 2,
    shipper_id: 1
  },
  {
    size: "20` Container",
    status: "sold",
    frieght_rate: 8000.98,
    route_id: 1,
    freight_type_id: 2,
    customer_id: 1,
    shipper_id: 2
  },
  {
    size: "LCL",
    status: "sold",
    frieght_rate: 4000.98,
    route_id: 2,
    freight_type_id: 1,
    customer_id: 2,
    shipper_id: 1
  },
  {
    size: "20` Container",
    status: "closed",
    frieght_rate: 6000.98,
    route_id: 3,
    freight_type_id: 1,
    customer_id: 1,
    shipper_id: 1
  }
])

