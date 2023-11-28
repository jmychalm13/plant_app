class CuttingsController < ApplicationController
  def index
    @cuttings = Cutting.all
    render :index
  end

  def create
    @cutting = Cutting.create(
      user_plant_id: params[:user_plant_id],
      zone_id: params[:zone_id],
      date_cut: params[:date_cut],
      roots: params[:roots],
    )
    render :show
  end
end
