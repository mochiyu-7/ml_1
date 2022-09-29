class CreateTaskManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :task_managers do |t|
      t.string :task
      t.string :detail

      t.timestamps
    end
  end
end
