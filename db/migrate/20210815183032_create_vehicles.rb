# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :customer
      t.string :vehicle_type # Can't use just `type` or STI will be assumed
      t.string :name
      t.integer :length

      t.timestamps
    end
  end
end
