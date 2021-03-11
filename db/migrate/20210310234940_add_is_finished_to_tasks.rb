class AddIsFinishedToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :is_finished, :boolean, :default => false
  end
end
