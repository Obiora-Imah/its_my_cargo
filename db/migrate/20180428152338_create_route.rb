class CreateRoute < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.integer :origin_port
      t.integer :destination_port

      t.timestamps
    end
  end
end
