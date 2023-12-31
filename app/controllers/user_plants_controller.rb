class UserPlantsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @user_plants = UserPlant.all
    render :index
  end

  def create
    @user_plant = UserPlant.create!(
      user_id: current_user.id,
      zone_id: params[:zone_id],
      type_id: params[:type_id],
      name: params[:name],
      img_url: params[:img_url],
    )
    render :show
  end

  def show
    @user_plant = UserPlant.find_by(id: params[:id])
    render :show
  end

  def update
    @user_plant = UserPlant.find_by(id: params[:id])
    @user_plant.update(
      user_id: current_user.id,
      zone_id: params[:zone_id] || @user_plant.zone_id,
      type_id: params[:type_id] || @user_plant.type_id,
      name: params[:name] || @user_plant.name,
      img_url: params[:img_url] || @user_plant.img_url,
    )
    render :show
  end

  def destroy
    user_plant = UserPlant.find(params[:id])
    user_plant.destroy

    render json: { message: "Plant destroyed successfully!" }
  end
end
