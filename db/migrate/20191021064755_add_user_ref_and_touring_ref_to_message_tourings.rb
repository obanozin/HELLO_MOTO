class AddUserRefAndTouringRefToMessageTourings < ActiveRecord::Migration[5.2]
  def change
    add_reference :message_tourings, :user, foreign_key: true
    add_reference :message_tourings, :touring, foreign_key: true
    change_column_null :message_tourings, :user_id, false
    change_column_null :message_tourings, :touring_id, false
  end
end
