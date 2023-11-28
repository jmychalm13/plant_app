class WateringSchedulesController < ApplicationController
  def create
    @watering_schedule = WateringSchedule.create(
      user_plant_id: params[:user_plant_id],
      schedule: params[:schedule],
    )

    if @watering_schedule.save
      render :show
    else
      render json: { message: "There is a problem adding this schedule." }
    end
  end
end
