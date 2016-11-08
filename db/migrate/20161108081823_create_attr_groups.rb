class CreateAttrGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :attr_groups do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
