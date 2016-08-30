class CreateAttributeOptions < ActiveRecord::Migration
  def change
    create_table :attribute_options do |t|
      t.integer :attribute_id, null: false
      t.string :value, null: false
      t.timestamps null: false
    end
  end
end
