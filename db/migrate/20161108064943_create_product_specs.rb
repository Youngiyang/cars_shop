class CreateProductSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :product_specs do |t|
      t.integer :product_id, null: false
      t.integer :spec_id, null: false
      t.timestamps
    end
  end
end
