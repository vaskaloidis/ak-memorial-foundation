class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :golfer_number
      t.string :email
      t.datetime :sent_at

      t.timestamps
    end
  end
end
