class CreateAttributeGroups < ActiveRecord::Migration
  def change
    create_table :attribute_groups do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :attribute_groups, :name, unique: true
  end
end
