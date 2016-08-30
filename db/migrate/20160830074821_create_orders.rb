class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_cn, null: false
      t.integer :user_id, null: false
      t.decimal :pay_price, null: false, precision: 11, scale: 2
      t.decimal :original_price, null: false, precision: 11, scale: 2
      t.integer :pay_status, null: false
      t.datetime :pay_time
      t.integer :order_status, null: false
      t.timestamps null: false
    end
  end
end
