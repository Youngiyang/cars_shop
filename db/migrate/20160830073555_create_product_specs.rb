class CreateProductSpecs < ActiveRecord::Migration
  def change
    create_table :product_specs do |t|
      t.integer :product_id, null: false
      t.integer :sepc_id, null: false
      t.timestamps null: false
    end
  end
end
