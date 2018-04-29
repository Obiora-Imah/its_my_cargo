class CreateFreights < ActiveRecord::Migration[5.0]
  def change
    create_table :freights do |t|
      t.decimal :freight_rate, precision: 10, scale: 2
      t.string :freight_capacity
      t.integer :sold_capacity
      t.string :freight_type
      t.references :route, index: true

      t.timestamps
    end
  end
end
