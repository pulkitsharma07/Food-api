class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.belongs_to :user
      t.boolean :delivered, default: false
      t.timestamps null: false
    end
  end
end
