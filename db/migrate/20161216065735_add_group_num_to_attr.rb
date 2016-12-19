class AddGroupNumToAttr < ActiveRecord::Migration[5.0]
  def change
    add_column :attrs, :group_num, :integer, null: false
    add_column :attrs, :is_default, :boolean, null: false, default: false
    remove_column :attrs, :attr_group_id
  end
end
