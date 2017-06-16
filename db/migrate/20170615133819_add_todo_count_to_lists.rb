class AddTodoCountToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :todo_count, :integer, default: 0
  end
end
