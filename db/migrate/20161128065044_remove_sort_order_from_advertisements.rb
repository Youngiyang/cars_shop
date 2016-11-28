class RemoveSortOrderFromAdvertisements < ActiveRecord::Migration[5.0]
  def change
    remove_column :advertisements, :sort_order, :int
  end
end
