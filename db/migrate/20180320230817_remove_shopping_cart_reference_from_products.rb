class RemoveShoppingCartReferenceFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:products, :shopping_cart, index: true, foreign_key: true)
  end
end
