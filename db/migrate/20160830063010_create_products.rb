class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :brand_id, null: false
      t.integer :category_id, null: false
      t.integer :photo_id, null: false
      t.string :slogan, null:false
      t.decimal :min_price, precision: 11, scale: 2
      t.timestamps null: false
    end
    add_index :products, :name, unique: true
  end
end
