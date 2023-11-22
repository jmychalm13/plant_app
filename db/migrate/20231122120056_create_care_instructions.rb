class CreateCareInstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :care_instructions do |t|
      t.integer :user_plant_id
      t.text :instructions

      t.timestamps
    end
  end
end
