class CreateOrderConsultations < ActiveRecord::Migration[5.0]
  def change
    create_table :order_consultations do |t|
      t.string :order_cn, null: false
      t.integer :user_id, null: false
      t.string :mobile, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
