class AddAmountToShoppingCart < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_carts, :amount, :decimal
  end
end
