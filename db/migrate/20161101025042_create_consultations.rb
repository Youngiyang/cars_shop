class CreateConsultations < ActiveRecord::Migration[5.0]
  def change
    create_table :consultations do |t|
      t.string :intention, null: false
      t.integer :province_id, null: false
      t.integer :city_id, null: false
      t.string :name, null: false
      t.string :phone_num, null: false
      t.timestamps
    end
  end
end
