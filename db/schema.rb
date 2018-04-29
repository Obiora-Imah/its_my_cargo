# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180428152338) do

  create_table "bookings", force: :cascade do |t|
    t.string   "size"
    t.string   "status"
    t.decimal  "frieght_rate"
    t.integer  "shipper_id"
    t.integer  "customer_id"
    t.integer  "freight_type_id"
    t.integer  "route_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["freight_type_id"], name: "index_bookings_on_freight_type_id"
    t.index ["route_id"], name: "index_bookings_on_route_id"
    t.index ["shipper_id"], name: "index_bookings_on_shipper_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freight_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freights", force: :cascade do |t|
    t.decimal  "freight_rate",     precision: 10, scale: 2
    t.string   "freight_capacity"
    t.integer  "sold_capacity"
    t.string   "freight_type"
    t.integer  "route_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["route_id"], name: "index_freights_on_route_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "origin_port"
    t.integer  "destination_port"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "status"
    t.decimal  "charge"
    t.integer  "weight"
    t.integer  "shipper_id"
    t.integer  "freight_id"
    t.integer  "route_id"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_shipments_on_customer_id"
    t.index ["freight_id"], name: "index_shipments_on_freight_id"
    t.index ["route_id"], name: "index_shipments_on_route_id"
    t.index ["shipper_id"], name: "index_shipments_on_shipper_id"
  end

  create_table "shippers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
