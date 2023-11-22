class CreateCuttings < ActiveRecord::Migration[7.0]
  def change
    create_table :cuttings do |t|
      t.integer :user_plant_id
      t.integer :zone_id
      t.integer :date_cut
      t.boolean :roots, default: false

      t.timestamps
    end
  end
end
