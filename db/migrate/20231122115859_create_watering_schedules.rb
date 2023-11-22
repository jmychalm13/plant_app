class CreateWateringSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :watering_schedules do |t|
      t.integer :user_plant_id

      t.timestamps
    end
  end
end
