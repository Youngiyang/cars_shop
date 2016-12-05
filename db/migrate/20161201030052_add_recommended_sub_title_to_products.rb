class AddRecommendedSubTitleToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :recommended_sub_title, :string
  end
end
