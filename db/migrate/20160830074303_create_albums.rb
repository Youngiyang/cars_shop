class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.timestamps null: false
    end
  end
end
