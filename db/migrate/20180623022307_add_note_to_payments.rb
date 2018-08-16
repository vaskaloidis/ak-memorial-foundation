class AddNoteToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :note, :string
  end
end
