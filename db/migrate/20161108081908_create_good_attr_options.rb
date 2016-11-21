class CreateGoodAttrOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :good_attr_options do |t|
      t.integer :good_id, null: false
      t.integer :attr_option_id, null: false
      t.timestamps
    end
  end
end
