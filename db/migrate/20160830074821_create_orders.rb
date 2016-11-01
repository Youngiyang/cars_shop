class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_cn, null: false
      t.integer :user_id, null: false
      t.integer :good_id, null: false
      t.string :name, null: false
      t.string :phone_num, null: false
      t.integer :province_id, null: false
      t.integer :city_id, null: false
      t.text :requirements, null: false, default: ""
      t.integer :status, null: false, default: 1
      t.timestamps null: false
    end
  end
end
