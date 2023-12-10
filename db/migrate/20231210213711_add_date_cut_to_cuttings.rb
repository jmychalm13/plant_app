class AddDateCutToCuttings < ActiveRecord::Migration[7.0]
  def change
    add_column :cuttings, :date_cut, :date
  end
end
