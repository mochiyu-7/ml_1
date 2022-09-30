class CreateTaskManagers < ActiveRecord::Migration[6.1]
  change_column :task_managers, :task, :detail, null: false

  def change
    create_table :task_managers do |t|
      t.string :task
      t.string :detail

      t.timestamps
    end
  end
end
