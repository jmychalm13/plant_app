class AddNameToUserPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :user_plants, :name, :string
  end
end
