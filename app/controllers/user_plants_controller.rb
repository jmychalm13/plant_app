class UserPlantsController < ApplicationController
  def index
    @user_plants = UserPlant.all
    render :index
  end
end
