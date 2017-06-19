class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.timestamps
    end

    add_index :shares, [:user_id, :list_id], unique: true 
  end
end
