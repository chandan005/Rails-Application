class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.references :plantation, index: true, foreign_key: true
      t.string :name, :null => false
      t.string :variety, :null => false
      t.string :color, :null => false

      t.timestamps null: false
    end
  end
end
