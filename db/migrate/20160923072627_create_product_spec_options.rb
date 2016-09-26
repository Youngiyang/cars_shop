class CreateProductSpecOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :product_spec_options do |t|
      t.integer :product_id, null: false
      t.integer :spec_option_id, null: false
      t.timestamps
    end
  end
end
