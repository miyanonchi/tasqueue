class TaskQueue < ApplicationRecord
  has_many :tasks, dependent: :destroy, foreign_key: "queue_id"
end
