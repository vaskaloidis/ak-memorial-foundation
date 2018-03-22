class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category
      t.decimal :price
      t.belongs_to :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
