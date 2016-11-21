class CreateAttrOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :attr_options do |t|
      t.integer :attr_id, null: false
      t.string :value, null: false
      t.timestamps
    end
  end
end
