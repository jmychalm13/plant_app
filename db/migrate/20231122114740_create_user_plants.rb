class CreateUserPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :user_plants do |t|
      t.integer :user_id
      t.integer :plant_id
      t.integer :zone_id
      t.integer :type_id
      t.string :img_url

      t.timestamps
    end
  end
end
