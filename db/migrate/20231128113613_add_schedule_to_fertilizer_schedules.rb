class AddScheduleToFertilizerSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :fertilizer_schedules, :schedule, :string
  end
end
