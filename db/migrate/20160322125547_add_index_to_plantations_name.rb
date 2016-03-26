class AddIndexToPlantationsName < ActiveRecord::Migration
  def change
  	add_index :plantations, :name, unique: true
  end
end
