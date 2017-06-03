class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string    :task,          null: false
      t.integer   :user_id,       null: false
      t.integer   :queue_id,      null: false
      t.integer   :created_by,    null: false
      t.integer   :order,         null: false, default: 1
      t.integer   :progress,      null: false, default: 0
      t.boolean   :done,          null: false, default: false
      t.datetime  :done_at

      t.index [:queue_id, :user_id, :order], unique: true, name: "queue_order_index"

      t.timestamps
    end
  end
end
