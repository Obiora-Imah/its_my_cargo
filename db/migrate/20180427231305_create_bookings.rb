class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :size
      t.string :status
      t.decimal :frieght_rate
      t.references :shipper, index: true
      t.references :customer, index: true
      t.references :freight_type, index: true
      t.references :route, index: true

      t.timestamps
    end
  end
end
