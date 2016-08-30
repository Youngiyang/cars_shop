class CreateGoodAttributeOptions < ActiveRecord::Migration
  def change
    create_table :good_attribute_options do |t|
      t.integer :good_id, null: false
      t.integer :attribute_option_idl, null: false
      t.timestamps null: false
    end
  end
end
