class RemovePlantIdFromUserPlant < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_plants, :plant_id
  end
end
