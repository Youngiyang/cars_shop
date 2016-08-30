class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id, null: false
      t.string :name, null: false
      t.string :img_url, null: false
      t.timestamps null: false
    end
  end
end
