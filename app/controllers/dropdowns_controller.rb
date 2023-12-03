class DropdownsController < ApplicationController
  def type
    type_objects = Type.all
    render json: type_objects
  end

  def zone
    zone_objects = Zone.all
    render json: zone_objects
  end

  def plant
    plants = UserPlant.all
    render json: plants
  end
end
