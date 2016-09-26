class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :product_id, null: false
      t.string :name, null: false
      t.string :photo_ids
      t.string :content_photo_ids
      t.string :source_from, null:false
      t.decimal :current_price, precision: 11, scale: 2
      t.decimal :market_price, precision: 11, scale: 2
      t.string :registered_info, null: false
      t.boolean :is_hot, null: false, default: false
      t.boolean :in_stock, null: false, default: false
      t.boolean :is_recommended, null: false, default: false
      t.integer :status, null: false, default: 0
      t.timestamps null: false
    end
  end
end
