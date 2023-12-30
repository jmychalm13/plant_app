class WateringSchedulesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @watering_schedules = WateringSchedule.all
    render :index
  end

  def show
    @watering_schedule = WateringSchedule.find(params[:id])
    render :show
  end

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

  def update
    @watering_schedule = WateringSchedule.find(params[:id])
    @watering_schedule.update(
      user_plant_id: params[:user_plant_id] || @watering_schedule.user_plant_id,
      schedule: params[:schedule] || @watering_schedule.schedule
    )
    if @watering_schedule.save
      render :show
    else
      render json: { message: "There has been an error." }
    end
  end

  def destroy
    watering_schedule = WateringSchedule.find(params[:id])
    watering_schedule.destroy
    render json: { message: "Schedule has been destroyed" }
  end
end
