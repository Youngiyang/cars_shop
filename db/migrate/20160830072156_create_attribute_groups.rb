class CreateAttributeGroups < ActiveRecord::Migration
  def change
    create_table :attribute_groups do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
