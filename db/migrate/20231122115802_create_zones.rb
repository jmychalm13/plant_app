class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.integer :user_id
      t.string :location_name
      t.string :light_level

      t.timestamps
    end
  end
end
