class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.integer :product_category

      t.timestamps
    end
  end
end
