class AddImgToCareInstructions < ActiveRecord::Migration[7.0]
  def change
    add_column :care_instructions, :img, :string
  end
end
