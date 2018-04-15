class ChangeDefaultGolferGroupEmailsNil < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :golfer2_email, nil
    change_column_default :users, :golfer3_email, nil
    change_column_default :users, :golfer4_email, nil
  end
end
