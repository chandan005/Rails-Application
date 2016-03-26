class AddLocationToPlantation < ActiveRecord::Migration
  def change
    add_column :plantations, :location, :string
  end
end
