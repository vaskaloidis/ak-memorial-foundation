class AddForcePasswordChangeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :force_password_change, :boolean, default: false
  end
end
