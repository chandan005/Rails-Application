class CreatePlantations < ActiveRecord::Migration
  def change
    create_table :plantations do |t|
      t.string :name, :null => false

      t.timestamps null: false
    end
  end
end
