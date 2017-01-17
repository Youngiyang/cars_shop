class CreateAuthCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_codes do |t|
      t.string :mobile, null: false
      t.string :code, null: false
      t.boolean :auth_state, null: false
      t.datetime :sent_at
      t.datetime :expire_at, null: false
    end
    add_index :auth_codes, :mobile
  end
end
