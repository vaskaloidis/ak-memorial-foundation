class AddDiscardedAtToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :discarded_at, :datetime
    add_index :purchases, :discarded_at
  end
end
