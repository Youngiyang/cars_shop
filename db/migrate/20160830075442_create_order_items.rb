class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :good_id, null: false
      t.integer :quantity, null: false, default: 1
      t.decimal :unit_price, null: false, precision: 11, scale: 2
      t.decimal :total_price, null: false, precision: 11, scale: 2
      t.timestamps null: false
    end
  end
end
