class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :account,      null: false, limit: 128
      t.string    :password,     null: false
      t.string    :family_name,  null: false, limit: 64
      t.string    :first_name,   null: false, limit: 64
      t.string    :email,        null: false, limit: 256
      t.boolean   :first_login,  null: false, default: true
      t.boolean   :deleted,      null: false, default: false
      t.datetime  :deleted_at

      t.index :account, unique: true, length: 128

      t.timestamps
    end
  end
end
