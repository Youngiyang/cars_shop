class CreateSpecOptions < ActiveRecord::Migration
  def change
    create_table :spec_options do |t|
      t.integer :spec_id, null: false
      t.string :value, null: false
      t.timestamps null: false
    end
  end
end
