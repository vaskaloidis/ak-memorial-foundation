class RemoveGolfersFromUserAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :golfer1_name
    remove_column :users, :golfer1_email

    add_column :users, :golfer14name, :string
    add_column :users, :golfer4_email, :string
  end
end
