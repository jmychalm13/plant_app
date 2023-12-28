class TypesController < ApplicationController
  def index
    @types = Type.all
    render :index
  end

  def create
    @type = Type.create(
      type_name: params[:type_name],
    )

    render :show
  end

  def show
    @type = Type.find_by(id: params[:id])
    render :show
  end

  def update
    @type = Type.find_by(id: params[:id])
    @type.update(
      type_name: params[:type_name] || @type.type_name
    )
    render :show
  end

  def destroy
    type = Type.find_by(id: params[:id])
    type.destroy
    render json: { message: "Type destroyed successfully" }
  end
end
