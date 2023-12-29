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

  def show
    @cutting = Cutting.find(params[:id])
    render :show
  end

  def update
    @cutting = Cutting.find(params[:id])
    @cutting.update(
      user_plant_id: params[:user_plant_id] || @cutting.user_plant_id,
      zone_id: params[:zone_id] || @cutting.zone_id,
      date_cut: params[:date_cut] || @cutting.date_cut,
      roots: params[:roots] || @cutting.roots,  
    )
    if @cutting.save
      render :show
    else
      render json: {message: "There was an error updating this cuttings info."}
    end
  end

  def destroy
    @cutting = Cutting.find(params[:id])
    @cutting.destroy
    render json: { message: "Cutting succussfully destroyed" }
  end
end
