class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|

      t.belongs_to :food_item, index: true
      t.belongs_to :order, index: true
      t.integer :quantity
      t.timestamps null: false

    end
  end
end
