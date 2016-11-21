class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ""
      t.timestamps null: false
    end
    add_index :specs, :name, unique: true
  end
end
