class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :status
      t.decimal :charge
      t.integer :weight

      t.references :shipper, index: true
      t.references :freight, index: true
      t.references :route, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
