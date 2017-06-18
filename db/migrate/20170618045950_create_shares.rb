class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|

      t.timestamps
    end
  end
end
