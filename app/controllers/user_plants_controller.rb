class UserPlantsController < ApplicationController
  def index
    @user_plants = UserPlant.all
    render :index
  end

  def create
    @user_plant = UserPlant.create(
      user_id: params[:user_id],
      plant_id: params[:plant_id],
      zone_id: params[:zone_id],
      type_id: params[:type_id],
      name: params[:name],
      img_url: params[img_url],
    )
    render :show
  end

  def show
    @user_plant = UserPlant.find_by(id: params[:id])
    render :show
  end
end
