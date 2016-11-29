class CreateImageUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :image_uploads do |t|
      t.string :file_name
      t.string :img_url

      t.timestamps
    end
  end
end
