class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.timestamps null: false
    end
  end
end
