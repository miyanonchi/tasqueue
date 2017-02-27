class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string    :name,        null: false, limit: 128
      t.boolean   :private,     null: false, default: false
      t.string    :updated_by,  null: false, limit: 128

      t.timestamps
    end
  end
end
