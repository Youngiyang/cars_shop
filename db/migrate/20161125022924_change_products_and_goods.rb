class ChangeProductsAndGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_hot, :boolean, null: false, default: false
    add_column :products, :is_recommended, :boolean, null: false, default: false
    add_column :products, :recommended_words, :string
    remove_columns :goods, :is_hot, :is_recommended, :recommended_words
  end
end
