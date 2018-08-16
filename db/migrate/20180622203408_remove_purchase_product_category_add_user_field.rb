class RemovePurchaseProductCategoryAddUserField < ActiveRecord::Migration[5.1]
  def change
    remove_column :purchases, :product_category
    add_reference(:purchases, :admin, foreign_key: false, null: true)
  end
end
