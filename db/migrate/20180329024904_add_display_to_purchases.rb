class AddDisplayToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :display, :boolean
  end
end
