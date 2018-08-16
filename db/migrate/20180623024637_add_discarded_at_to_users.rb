class AddDiscardedAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :discarded_at, :datetime
    add_index :users, :discarded_at
    add_column :invites, :discarded_at, :datetime
    add_index :invites, :discarded_at
  end
end
