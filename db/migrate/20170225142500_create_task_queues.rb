class CreateTaskQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :task_queues do |t|
      t.string    :name,       null: false, limit: 128
      t.integer   :user_id,    null: false

      t.index [:name, :user_id], unique: true

      t.timestamps
    end
  end
end
