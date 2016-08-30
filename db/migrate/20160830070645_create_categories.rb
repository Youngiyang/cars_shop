class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :parent_id, null: false, default: 0
      t.text :description, null: false, default: ""
      t.integer :sort_order, null: false
      t.timestamps null: false
    end
  end
end
