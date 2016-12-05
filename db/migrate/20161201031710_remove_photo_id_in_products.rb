class RemovePhotoIdInProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :photo_id
  end
end
