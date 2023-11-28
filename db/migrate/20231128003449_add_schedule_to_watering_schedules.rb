class AddScheduleToWateringSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :watering_schedules, :schedule, :string
  end
end
