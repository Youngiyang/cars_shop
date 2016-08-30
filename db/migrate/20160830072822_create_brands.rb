class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :en_name
      t.string :cn_name, null: false
      t.string :logo, null: false
      t.integer :sort_order, null: false
      t.boolean :is_show, null: false, default: false
      t.string :nationality, null: false, default: ""
      t.timestamps null: false
    end
  end
end
