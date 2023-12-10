class RemoveDateCutFromCuttings < ActiveRecord::Migration[7.0]
  def change
    remove_column :cuttings, :date_cut, :integer
  end
end
