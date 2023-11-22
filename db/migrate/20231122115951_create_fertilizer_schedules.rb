class CreateFertilizerSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :fertilizer_schedules do |t|
      t.integer :user_plant_id

      t.timestamps
    end
  end
end
