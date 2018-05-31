class AddPaymentTypeToPurchase < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :payment_type, :integer
  end
end
