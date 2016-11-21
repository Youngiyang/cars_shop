class CreateGoodSpecOptions < ActiveRecord::Migration
  def change
    create_table :good_spec_options do |t|
      t.integer :good_id, null: false
      t.integer :spec_option_id, null: false
      t.timestamps null: false
    end
  end
end
