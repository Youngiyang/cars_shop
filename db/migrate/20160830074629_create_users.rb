class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile, null: false
      t.string :password_digest, null: false
      t.string :user_name
      t.timestamps null: false
    end
    add_index :users, :mobile, unique: true
  end
end
