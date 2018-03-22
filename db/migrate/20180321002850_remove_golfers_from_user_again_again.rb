class RemoveGolfersFromUserAgainAgain < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :golfer14name

    add_column :users, :golfer4_name, :string
  end
end
