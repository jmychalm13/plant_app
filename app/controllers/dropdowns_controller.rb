class DropdownsController < ApplicationController
  def type
    types = []
    type_objects = Type.all
    type_objects.each do |type|
      types << type.type_name
    end
    render json: types
  end
end
