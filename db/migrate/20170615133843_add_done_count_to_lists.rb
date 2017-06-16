class AddDoneCountToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :done_count, :integer, default: 0
  end
end
