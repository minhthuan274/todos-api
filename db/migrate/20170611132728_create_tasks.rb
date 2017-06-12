class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :complete, :default => false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
