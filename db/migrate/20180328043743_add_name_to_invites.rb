class AddNameToInvites < ActiveRecord::Migration[5.1]
  def change
    add_column :invites, :name, :string
  end
end
