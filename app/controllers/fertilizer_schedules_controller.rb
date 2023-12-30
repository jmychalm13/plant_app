class FertilizerSchedulesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]


  def index
    @fertilizer_schedules = FertilizerSchedule.all
    render :index
  end

  def create
    @fertilizer_schedule = FertilizerSchedule.create(
      user_plant_id: params[:user_plant_id],
      schedule: params[:schedule],
    )
    render :show
  end

  def show
    @fertilizer_schedule = FertilizerSchedule.find(params[:id])
    render :show
  end

  def update
    @fertilizer_schedule = FertilizerSchedule.find(params[:id])
    @fertilizer_schedule.update(
      user_plant_id: params[:user_plant_id] || @fertilizer_schedule.user_plant_id,
      schedule: params[:schedule] || @fertilizer_schedule.schedule
    )
    render :show
  end

  def destroy
    fertilizer_schedule = FertilizerSchedule.find(params[:id])
    fertilizer_schedule.destroy
    render json: { message: "Fertilizer schedule successfully destroyed" }
  end
end
