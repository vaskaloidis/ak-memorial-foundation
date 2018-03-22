class RemoveGolfersFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :golfer2
    remove_column :users, :golfer3
    remove_column :users, :golfer4

    add_column :users, :golfer1_name, :string
    add_column :users, :golfer1_email, :string

    add_column :users, :golfer2_name, :string
    add_column :users, :golfer2_email, :string

    add_column :users, :golfer3_name, :string
    add_column :users, :golfer3_email, :string

  end
end
