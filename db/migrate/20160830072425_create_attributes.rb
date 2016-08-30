class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.integer :attribute_group_id, null: false
      t.string :key, null: false
      t.timestamps null: false
    end
  end
end
