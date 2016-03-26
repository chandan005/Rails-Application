class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.references :plantation, index: true, foreign_key: true
      t.string :name, :null => false
      t.string :variety, :null => false
      t.string :color, :null => false
      t.integer :time, :null => false

      t.timestamps null: false
    end
  end
end
