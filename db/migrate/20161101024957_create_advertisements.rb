class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :img_url, null: false
      t.string :link
      t.text :description, null: false, default: ""
      t.integer :position, null: false
      t.integer :sort_order, null: false
      t.timestamps
    end
  end
end
