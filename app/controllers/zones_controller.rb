class ZonesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @zone = Zone.all
    render :index
  end

  def create
    @zone = Zone.create(
      user_id: current_user.id,
      location_name: params[:location_name],
      light_level: params[:light_level],
    )
    render :show
  end

  def show
    @zone = Zone.find(params[:id])
    render :show
  end

  def update
    @zone = Zone.find(params[:id])
    @zone.update(
      user_id: current_user.id,
      location_name: params[:location_name] || @zone.location_name,
      light_level: params[:light_level] || @zone.light_level,
    )
    render :show
  end

  def destroy
    zone = Zone.find(params[:id])
    zone.destroy
    render json: { message: "Zone successfully destroyed." }
  end
end
