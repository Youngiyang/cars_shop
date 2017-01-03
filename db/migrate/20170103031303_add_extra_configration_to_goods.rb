class AddExtraConfigrationToGoods < ActiveRecord::Migration[5.0]
  def change
    add_column :goods, :extra_configration, :string, null: false
  end
end
