class MoveContentPhotosToProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :goods, :content_photo_ids
    add_column :products, :content_photo_ids, :string
  end
end
